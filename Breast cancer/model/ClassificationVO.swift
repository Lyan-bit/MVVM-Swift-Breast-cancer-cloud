import Foundation
import Darwin

class ClassificationVO : Identifiable
{
    var id : String = UUID().uuidString
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
    
    static var defaultInstance : ClassificationVO? = nil
    var errorlist : [String] = [String]()


  init() {
  //init
  }


  static func defaultClassificationVO() -> ClassificationVO
  { if defaultInstance == nil
    { defaultInstance = ClassificationVO() }
    return defaultInstance!
  }

    init(idx : String, agex: Float, bmix: Float, glucosex: Float,
         insulinx: Float, homax: Float, leptinx: Float,
         adiponectinx: Float, resistinx: Float, mcpx: Float,
         resultx: String)  {
        
        id = idx
        age = agex
        bmi = bmix
        glucose = glucosex
        insulin = insulinx
        homa = homax
        leptin = leptinx
        adiponectin = adiponectinx
        resistin = resistinx
        mcp = mcpx
        result = resultx
    }
    
    init(x : Classification)  {
        
        id = x.id
        age = x.age
        bmi = x.bmi
        glucose = x.glucose
        insulin = x.insulin
        homa = x.homa
        leptin = x.leptin
        adiponectin = x.adiponectin
        resistin = x.resistin
        mcp = x.mcp
        result = x.result
    }

    func toString() -> String {
        return "" + "id= " + id + ", " + "age= " + String(age) + ", " + "bmi= " + String(bmi) + ", " + "glucose= " + String(glucose) + ", " + "insulin= " + String(insulin) + ", " + "homa= " + String(homa) + ", " + "leptin= " + String(leptin) + ", " + "adiponectin= " + String(adiponectin) + ", " + "resistin= " + String(resistin) + ", " + "mcp= " + String(mcp) + ", " + "result= " + result
    }
    
    func getid() -> String
    { return id }
    
    func getage() -> Float
    { return age }
    
    func getbmi() -> Float
    { return bmi }
    
    func getglucose() -> Float
    { return glucose }
    
    func getinsulin() -> Float
    { return insulin }
    
    func gethoma() -> Float
    { return homa }
    
    func getleptin() -> Float
    { return leptin }
    
    func getadiponectin() -> Float
    { return adiponectin }
    
    func getresistin() -> Float
    { return resistin }
    
    func getmcp() -> Float
    { return mcp }
    
    func getresult() -> String
    { return result }
    
    func setid(x : String)
    { id = x }
    
    func setage(x : Float)
    { age = x }
    
    func setbmi(x : Float)
    { bmi = x }
    
    func setglucose(x : Float)
    { glucose = x }
    
    func setinsulin(x : Float)
    { insulin = x }
    
    func sethoma(x : Float)
    { homa = x }
    
    func setleptin(x : Float)
    { leptin = x }
    
    func setadiponectin(x : Float)
    { adiponectin = x }
    
    func setresistin(x : Float)
    { resistin = x }
    
    func setmcp(x : Float)
    { mcp = x }
    
    func setresult(x : String)
    { result = x }

  func resetData()
  { errorlist = [String]() }

  func iscreateClassificationerror() -> Bool
  { resetData()
    return errorlist.count > 0
  }

  func iseditClassificationerror() -> Bool
  { return iscreateClassificationerror() }

  func islistClassificationerror() -> Bool
  { return false }

  func isdeleteClassificationerror() -> Bool
  { return false }

  func errors() -> String
  { var res : String = ""
    for (_,x) in errorlist.enumerated()
    { res = res + x + ", " }
    return res
  }
}


