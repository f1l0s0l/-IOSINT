//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Илья Сидорик on 16.01.2023.
//

import SnapKit
import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    
   private var statusText = StatusText(text: "Любимая доча")

    
    lazy var userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .orange
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "Ария"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
        
    private lazy var buttonShowStatus: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 14
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    private lazy var userStatus: UILabel = {
        let label = UILabel()
        label.text = "Любимая доча"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var changeUserStatus: TextFieldWithPadding = {
        let text = TextFieldWithPadding()
        text.backgroundColor = .white
        text.placeholder = "Любимая доча"
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.layer.cornerRadius = 12
        text.textPadding.left = 7
        return text
    }()
    
 
    // MARK: - Life cycle
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViewItems()

    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    private func setupViewItems() {
        self.addSubview(userName)
        self.addSubview(buttonShowStatus)
        self.addSubview(userStatus)
        self.addSubview(changeUserStatus)
        self.addSubview(userPhoto)
        self.buttonShowStatus.addTarget(self, action: #selector(tapOnButtonShowStatus), for: .touchUpInside)
        //Добавил прстую аниманию нажатия на кнопку
        self.buttonShowStatus.addTarget(self, action: #selector(tapDownButtonShowStatus), for: .touchDown)
        //Добавил изменение текста на кнопке в "Set status" согласно макету
        self.changeUserStatus.addTarget(self, action: #selector(titleButtonShowStatusChange), for: .touchDown) //!!!!!!!!
        self.changeUserStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        self.setupConstraint()
    }
    
    
    
    //Тут я добавил простую анимацию нажатия на кнопку
    @objc
    func tapOnButtonShowStatus() {
        buttonShowStatus.alpha = 1
        userStatus.text = statusText.text
        changeUserStatus.placeholder = statusText.text
        print(userStatus.text ?? "Нет статуса")
        //Добавил закрытие клавиатуры по нажатию на эту кнопку
        self.endEditing(true)
        buttonShowStatus.setTitle("Show status", for: .normal)
    }
    
    @objc
    func tapDownButtonShowStatus() {
        buttonShowStatus.alpha = 0.6
    }
    
    @objc
    func statusTextChanged(_ textField: UITextField){
        statusText.text = textField.text ?? statusText.text
    }
    //Добавил изменение текста на кнопке в "Set status" согласно макету
    @objc
    func titleButtonShowStatusChange(){
        buttonShowStatus.setTitle("Set status", for: .normal)
    }
    
    
    // MARK: - Constraint
    
    
    private func setupConstraint() {
        
        userPhoto.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
            make.height.width.equalTo(110)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(18)
            make.centerX.equalToSuperview()
        }
        
        buttonShowStatus.snp.makeConstraints { make in
            make.top.equalTo(self.userPhoto.snp.bottom).offset(31)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        userStatus.snp.makeConstraints { make in
            make.left.equalTo(self.userName)
            make.bottom.equalTo(self.buttonShowStatus.snp.top).offset(-59)
            make.height.equalTo(14)
        }
        
        changeUserStatus.snp.makeConstraints { make in
            make.top.equalTo(self.userStatus.snp.bottom).offset(10)
            make.left.equalTo(self.userStatus)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        
        
    }

}
