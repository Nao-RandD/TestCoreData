//
//  Title.swift
//  TestCoreData
//
//  Created by Nao RandD on 2023/07/08.
//

import Foundation

enum Title: String, CaseIterable, Codable, Identifiable {
    var id: String { rawValue }

    case ryuo = "竜王"
    case meijin = "名人"
    case ouza = "王座"
    case oui = "王位"
    case ousyo = "王将"
    case kisei = "棋聖"
    case kio = "棋王"
    case eio = "叡王"
    case none = "なし"
}
