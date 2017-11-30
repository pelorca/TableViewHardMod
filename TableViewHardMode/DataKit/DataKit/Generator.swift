//
//  Generator.swift
//  DataKit
//
//  Created by Eduardo Pelorca on 29/11/17.
//  Copyright © 2017 Eduardo Pelorca. All rights reserved.
//

import Foundation

public func generateIcons(_ maxSection : Int, _ maxRow : Int) -> [Int : [Icon]] {
    var dict = [Int : [Icon]]()
    for i in 0 ..< maxSection {
        var icons = [Icon]()
        for _ in 0..<maxRow {
            let iconName = randomIconName()
            let icon = Icon(name: iconName, imageName: iconName, description: randomDilmaDescription())
            icons.append(icon)
        }
        dict[i] = icons
    }
    return dict
}

public func getRandomColor() -> UIColor{
    
    let randomRed:CGFloat = CGFloat(drand48())
    
    let randomGreen:CGFloat = CGFloat(drand48())
    
    let randomBlue:CGFloat = CGFloat(drand48())
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    
}

public func generateImage(_ maxSection : Int, _ maxRow : Int) -> [Int : [NetworkImage]] {
    var dict = [Int : [NetworkImage]]()
    for i in 0 ..< maxSection {
        var images = [NetworkImage]()
        for _ in 0..<maxRow {
            let iconName = randomIconName()
            let image = NetworkImage(name: iconName, link: randomImageUrl(), description: randomDilmaDescription())
            images.append(image)
        }
      dict[i] = images
    }
    return dict
}

open class Icon {
    public let name: String
    public let imageName: String
    public let description: String
    
    public init(name: String, imageName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.description = description
    }
}

open class NetworkImage {
    public let name: String
    public let link: String
    public let description: String
    
    public init(name: String, link: String, description: String) {
        self.name = name
        self.link = link
        self.description = description
    }
    
   
    
}

fileprivate func randomDilmaDescription() -> String {
    let strs = [
        "A única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério.",
        "É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.",
        "Todos as descrições das pessoas são sobre a humanidade do atendimento, a pessoa pega no pulso, examina, olha com carinho.",
        "Então eu acho que vai ter outra coisa, que os médicos cubanos trouxeram pro brasil, um alto grau de humanidade.",
        "Primeiro eu queria cumprimentar os internautas. -Oi Internautas! Depois dizer que o meio ambiente é sem dúvida nenhuma uma ameaça ao desenvolvimento sustentável.",
        "E isso significa que é uma ameaça pro futuro do nosso planeta e dos nossos países. O desemprego beira 20%, ou seja, 1 em cada 4 portugueses.",
        "Eu dou dinheiro pra minha filha. Eu dou dinheiro pra ela viajar, então é... é... Já vivi muito sem dinheiro, já vivi muito com dinheiro.",
        "-Jornalista: Coloca esse dinheiro na poupança que a senhora ganha R$10 mil por mês. -Dilma: O que que é R$10 mil?"
    ]
    let r = arc4random_uniform(UInt32(strs.count))
    return strs[Int(r)]
}

fileprivate func randomIconName() -> String {
    let strs = [
        "AirPlay Icon",
        "Back",
        "Cancel",
        "Chevron",
        "Edit",
        "For You Copy",
        "Location",
        "Plus",
        "Rectangle 1306",
        "Search Icon",
        "Selected",
        "Shape",
        "Share"
    ]
    let r = arc4random_uniform(UInt32(strs.count))
    return strs[Int(r)]
}

fileprivate func randomImageUrl() -> String {
    return "https://picsum.photos/\(arc4random_uniform(900) + 100)/?random"
}

extension UIImageView {
   public func downloadImage(_ url: URL) {
        guard let data = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: data)
    }
}

