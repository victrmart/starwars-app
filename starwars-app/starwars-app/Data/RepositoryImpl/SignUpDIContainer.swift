//
//  SignUpDIContainer.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class SignUpDIContainer:SignupRoutes {
    
    func makeConfirmPassViewController(vm: SignUpViewModel) -> SignUpViewController {
        return SignUpViewController.instantiate(viewModel: vm)
    }
}
