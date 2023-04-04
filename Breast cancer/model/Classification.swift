class Classification : Decodable {
    
    private static var instance : Classification? = nil

  init() {
  //init
  }
    
    init(copyFrom: Classification) {
        
        self.id = "copy" + copyFrom.id
        self.age = copyFrom.age
        self.bmi = copyFrom.bmi
        self.glucose = copyFrom.glucose
        self.insulin = copyFrom.insulin
        self.homa = copyFrom.homa
        self.leptin = copyFrom.leptin
        self.adiponectin = copyFrom.adiponectin
        self.resistin = copyFrom.resistin
        self.mcp = copyFrom.mcp
        self.result = copyFrom.result
    }

    func copy() -> Classification
    { let res : Classification = Classification(copyFrom: self)
        addClassification(instance: res)
        return res
    }

    static func defaultInstanceClassification() -> Classification
    { if (instance == nil)
      { instance = createClassification() }
      return instance!
    }

    deinit
    { killClassification(obj: self) }
    
    var id : String = "" /* principal key */
    var age: Float = 0
    var bmi: Float = 0
    var glucose: Float = 0
    var insulin: Float = 0
    var homa: Float = 0
    var leptin: Float = 0
    var adiponectin: Float = 0
    var resistin: Float = 0
    var mcp: Float = 0
    var result: String = ""

    static var classificationIndex : Dictionary<String,Classification> = [String:Classification]()

    static func getByPKClassification(index : String) -> Classification?
    { return classificationIndex[index] }

}

var classificationAllInstances : [Classification] = [Classification]()

func createClassification() -> Classification
{ let result : Classification = Classification()
    classificationAllInstances.append(result)
  return result
}

func addClassification(instance : Classification)
{ classificationAllInstances.append(instance) }

func killClassification(obj: Classification)
{ classificationAllInstances = classificationAllInstances.filter{ $0 !== obj } }

func createByPKClassification(key : String) -> Classification
{ var result : Classification? = Classification.getByPKClassification(index: key)
  if result != nil { 
  return result! }
  result = Classification()
    classificationAllInstances.append(result!)
    Classification.classificationIndex[key] = result!
  result!.id = key
  return result! }

func killClassification(key : String)
{ Classification.classificationIndex[key] = nil
    classificationAllInstances.removeAll(where: { $0.id == key })
}



