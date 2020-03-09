//
//  SingUpUseCase.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SignUpUseCase {
    private let signUpImpl: SignUpRepositorImpl
    private let disposeBag = DisposeBag()
    
    init(signUpImpl: SignUpRepositorImpl) {
        self.signUpImpl = signUpImpl
    }
    
    func registerUser(email: String, password:String) -> Single<String> {
       return signUpImpl.registerUser(email: email, password: password)
    }
    
    func sendData(name: String, birthday: String, email: String, password: String, uid: String) -> Single<Bool> {
        return signUpImpl.sendData(name: name, birthday: birthday, email: email, password: password, uid: uid)
    }
}
