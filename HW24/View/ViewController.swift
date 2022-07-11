//
//  ViewController.swift
//  URLSessionStartProject
//
//  Created by Alexey Pavlov on 29.11.2021.
//

import UIKit
import CommonCrypto

class ViewController: UIViewController {
    
    private let endpointClient = EndpointClient(applicationSettings: ApplicationSettingsService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        executeCall()
    }
    
    func executeCall() {
        let endpoint = GetNameEndpoint()
        let completion: EndpointClient.ObjectEndpointCompletion<Cards> = { result, response in
            guard let responseUnwrapped = response else { return }
            
            print("\n\n response = \(responseUnwrapped.allHeaderFields) ;\n \(responseUnwrapped.statusCode) \n")
            switch result {
            case .success(let cardsJSON):
                cardsJSON.cards.forEach {
                    print(" Имя: \($0.name ?? "nil")\n",
                          "Мановая стоимость: \($0.manaCost ?? "nil")\n",
                          "Тип: \($0.type ?? "nil")\n",
                          "Редкость: \($0.rarity ?? "nil")\n",
                          "Название сета: \($0.setName ?? "nil")\n",
                          "Художник: \($0.artist ?? "nil")\n",
                          "Количество: \($0.number ?? "nil")\n")
                }
                print("-------------------------------------------------------")
            case .failure(let error):
                print(error)
            }
        }
        
        endpointClient.executeRequest(endpoint, completion: completion)
    }
    
}

final class GetNameEndpoint: ObjectResponseEndpoint<Cards> {
    
    override var method: RESTClient.RequestType { return .get }
    override var path: String { "/v1/cards" }
    
    override init() {
        super.init()
        
        queryItems = [URLQueryItem(name: "name", value: "Opt|Black Lotus")]
    }
}
