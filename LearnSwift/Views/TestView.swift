//
//  TestView.swift
//  LearnSwift
//
//  Created by Cristina on 2021-12-21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if (model.currentQuestion != nil) {
            
            VStack {
                // Question number
                Text("Qestion \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                // Question
                CodeTextView()
                
                // Answers
                
                // Button
                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        else {
            // Test hasn't loaded yet
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
