//
//  ContentView.swift
//  Breast cancer
//
//  Created by Lyan Alwakeel on 07/11/2022.
//

import SwiftUI

struct CreateView: View {
    @State var bean : ClassificationVO = ClassificationVO()
    @ObservedObject var model : CRUDViewModel
    
    var body: some View {
        NavigationView{
        ScrollView{
        VStack {
            HStack {
                Text("Age:")
                    .font(.headline)
                    .bold()
            TextField("Age", value: $bean.age, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("BMI:")
                    .font(.headline)
                    .bold()
            TextField("BMI", value: $bean.bmi, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("Glucose:")
                    .font(.headline)
                    .bold()
            TextField("Glucose", value: $bean.glucose, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack{
                Text("Insulin:")
                    .font(.headline)
                    .bold()
            TextField("Insulin", value: $bean.insulin, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack{
                Text("HOMA:")
                    .font(.headline)
                    .bold()
            TextField("HOMA", value: $bean.homa, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("Leptin:")
                    .font(.headline)
                    .bold()
            TextField("Leptin", value: $bean.leptin, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("Adiponectin:")
                    .font(.headline)
                    .bold()
            TextField("Adiponectin", value: $bean.adiponectin, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack {
                Text("Resistin:")
                    .font(.headline)
                    .bold()
            TextField("Resistin", value: $bean.resistin, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack{
                Text("MCP:")
                    .font(.headline)
                    .bold()
            TextField("MCP", value: $bean.mcp, format: .number)
                .keyboardType(.numberPad)
                .padding()
            }
            
            HStack(spacing: 20) {
                Text("Result:")
                    .font(.headline)
                    .bold()
                Text("\(bean.result)")
                    .font(.headline)
                    .bold()
            }
        }
        VStack(alignment: HorizontalAlignment.leading, spacing: 20){
            HStack {
              Button(action: { self.model.createClassification(x: bean) } ) { Text("Create") }
              Button(action: { self.model.cancelcreateClassification() } ) { Text("Cancel") }
            }.buttonStyle(DefaultButtonStyle())
        }.padding(.top)
        }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(model: CRUDViewModel.getInstance())
    }
}
