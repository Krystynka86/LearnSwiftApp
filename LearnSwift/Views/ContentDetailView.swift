//
//  ContentDetailView.swift
//  LearnSwift
//
//  Created by Cristina on 2021-12-20.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        VStack {
        // Only show the video if we get valid URL
        if url != nil {
        VideoPlayer(player: AVPlayer(url: url!))
                .cornerRadius(10)
        }
        
        // TODO: Description
            CodeTextView()
        
        // Show Next Lesson Button only if there is a next lesson
            if model.hasNextLesson() {
                
                Button(action: {
                   
                    // Advance the lesson
                    model.nextLesson()
                    
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                            
                    
                    Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })
                
            }
            else {
                // Show the complete button instead
                Button(action: {
                   
                    // Take the user to the HomeView
                    model.currentContentselected = nil
                    
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                            
                    
                    Text("Complete")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })
            }
            
        }
        .padding()
        .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
