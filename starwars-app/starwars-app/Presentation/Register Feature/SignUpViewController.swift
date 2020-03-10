//
//  SingUpViewController.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var emailBorder: UITextField!
    @IBOutlet weak var nameBorder: UITextField!
    @IBOutlet weak var birthdayBorder: UITextField!
    
    @IBOutlet weak var btnConfirm: UIButton!
    var viewModel: SignUpContract!
    let disposedBag = DisposeBag()
    let appDI = AppDIContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        emailBorder.layer.borderColor = (UIColor(named: "borderColor") as! CGColor)
        nameBorder.layer.borderColor = (UIColor(named: "borderColor") as! CGColor)
        birthdayBorder.layer.borderColor = (UIColor(named: "borderColor") as! CGColor)
    }
    
    static func instantiate(viewModel: SignUpContract) -> SignUpViewController {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        view.viewModel = viewModel
        return view
    }
    
    func bind() {
        btnConfirm.rx.tap.bind {
            if let email = self.emailTextField.text, let name = self.nameTextField.text, let birthday = self.birthdayTextField.text {
                    
//                let teste = Teste(name:name,birth:birth,email:email)
//                route.instantiate(struct:teste)
            }
        }.disposed(by: disposedBag)
        
        self.viewModel.finishRegister.drive(onNext: { (register) in
            if (register != nil) {
                if let email = self.emailTextField.text, let name = self.nameTextField.text, let birthday = self.birthdayTextField.text {
                    self.viewModel.makeRegister(name: name, birthday: birthday, email: email, password: password)
                }
            }else {
                //mostrar erro de cadastro
            }
        }).disposed(by: disposedBag)
    }
    
}
protocol SignupRoutes {
    func makeHomeViewController()
}
