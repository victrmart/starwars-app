//
//  SingUpRepositoryImpl.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SignUpRepositorImpl: SignUpRepository {
  
    
    
    let signUpService = SignUpService()
    func registerUser(email: String, password: String) -> Single<String> {
        signUpService.registerUser(email: email, password: password)
    }
    
    func sendData(name: String, birthday: String, email: String, password: String, uid: String) -> Single<Bool> {
        signUpService.sendData(name: name, birthday: birthday, email: email, password: password, uid: uid )
      }
    
    
}
