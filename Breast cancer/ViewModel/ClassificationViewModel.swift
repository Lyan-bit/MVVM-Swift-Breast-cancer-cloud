//
//  classificationvm.swift
//  Breast cancer
//
//  Created by Lyan Alwakeel on 08/11/2022.
//

import Foundation

class ClassificationViewModel: ObservableObject {
    static var instance : ClassificationViewModel? = nil
    private var crudvm : CRUDViewModel = CRUDViewModel.getInstance()
    private var modelParser : ModelParser? = ModelParser(modelFileInfo: ModelFile.modelInfo)
    
    static func getInstance() -> ClassificationViewModel
    { if instance == nil
      { instance = ClassificationViewModel()}
      return instance!
    }
    
    
    func classify(id : String) -> String{
        guard let obj = crudvm.getClassificationByPK(val: id)
        else {
            return "Please selsect valid id"
        }
        
        guard let result = self.modelParser?.runModel(
            withInput1: obj.age, withInput2:  obj.bmi, withInput3:  obj.glucose,
            withInput4: obj.insulin, withInput5:  obj.homa, withInput6:  obj.leptin,
            withInput7: obj.adiponectin, withInput8:  obj.resistin, withInput9:  obj.mcp
        ) else{
            return "Error"
        }
        
        obj.result = result
        crudvm.persistClassification(x: obj)
        
        return result
    }
}
