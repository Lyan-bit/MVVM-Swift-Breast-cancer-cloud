//
//  Breast_cancerApp.swift
//  Breast cancer
//
//  Created by Lyan Alwakeel on 07/11/2022.
//

import SwiftUI
import Firebase

@main
struct BreastCancerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(model: CRUDViewModel.getInstance(), classificationvm: ClassificationViewModel.getInstance())
        }
    }
}
