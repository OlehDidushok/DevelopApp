//
//  CardModel.swift
//  DevelopApp
//
//  Created by Oleh on 08.11.2024.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
