//
//  Extensions.swift
//  Netflix
//
//  Created by Yerasyl Sharipov on 19.04.2023.
//

import Foundation
extension String {
    func capitalizeFirstLatter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
