//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by 정원호 on 2021/12/05.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports":"⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals":"🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces":"😀😌😎🤓😠😤😭😰😱😳😜😇"
    ]

    // Any의 형태라면 as? 를 이용하여 하위 형변환을 주로 같이 사용함.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme"{
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }

}
