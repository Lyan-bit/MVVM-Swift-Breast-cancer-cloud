import Foundation

class ClassificationDAO
{ static func getURL(command : String?, pars : [String], values : [String]) -> String
  { var res : String = "base url for the data source"
    if command != nil
    { res = res + command! }
    if pars.count == 0
    { return res }
    res = res + "?"
    for (i,v) in pars.enumerated()
    { res = res + v + "=" + values[i]
      if i < pars.count - 1
      { res = res + "&" }
    }
    return res
  }

  static func isCached(id : String) -> Bool
    { let x : Classification? = Classification.classificationIndex[id]
    if x == nil 
    { return false }
    return true
  }

  static func getCachedInstance(id : String) -> Classification
    { return Classification.classificationIndex[id]! }

  static func parseCSV(line: String) -> Classification?
  { if line.count == 0
    { return nil }
    let line1vals : [String] = Ocl.tokeniseCSV(line: line)
    var classificationx : Classification? = nil
      classificationx = Classification.classificationIndex[line1vals[0]]
    if classificationx == nil
    { classificationx = createByPKClassification(key: line1vals[0]) }
      classificationx!.age = Float(line1vals[0]) ?? 0
      classificationx!.bmi = Float(line1vals[1]) ?? 0
      classificationx!.glucose = Float(line1vals[2]) ?? 0
      classificationx!.insulin = Float(line1vals[3]) ?? 0
      classificationx!.homa = Float(line1vals[4]) ?? 0
      classificationx!.leptin = Float(line1vals[5]) ?? 0
      classificationx!.adiponectin = Float(line1vals[6]) ?? 0
      classificationx!.resistin = Float(line1vals[7]) ?? 0
      classificationx!.mcp = Float(line1vals[8]) ?? 0
      classificationx!.result = line1vals[9]
      classificationx!.id = line1vals[10]
    return classificationx
  }

  static func parseJSON(obj : [String : AnyObject]?) -> Classification? {
    if let jsonObj = obj
    { let id : String? = jsonObj["id"] as! String?
      var classificationx : Classification? = Classification.classificationIndex[id!]
      if (classificationx == nil)
      { classificationx = createByPKClassification(key: id!) }
       
        if (classificationx !== nil) {
        classificationx!.age = jsonObj["age"] as! Float;
        classificationx!.bmi = jsonObj["bmi"] as! Float;
        classificationx!.glucose = jsonObj["glucose"] as! Float;
        classificationx!.insulin = jsonObj["insulin"] as! Float;
        classificationx!.homa = jsonObj["homa"] as! Float;
        classificationx!.leptin = jsonObj["leptin"] as! Float;
        classificationx!.adiponectin = jsonObj["adiponectin"] as! Float;
        classificationx!.resistin = jsonObj["resistin"] as! Float;
        classificationx!.mcp = jsonObj["mcp"] as! Float;
        classificationx!.result = jsonObj["result"] as! String;
        classificationx!.id = jsonObj["id"] as! String;
            
        }
      return classificationx!
    }
    return nil
  }

  static func writeJSON(x : Classification) -> NSDictionary
  { return [
       "age":  NSNumber(value: x.age),
       "bmi": NSNumber(value: x.bmi),
       "glucose":  NSNumber(value: x.glucose),
       "insulin": NSNumber(value: x.insulin),
       "homa":  NSNumber(value: x.homa),
       "leptin": NSNumber(value: x.leptin),
       "adiponectin":  NSNumber(value: x.adiponectin),
       "resistin": NSNumber(value: x.resistin),
       "mcp":  NSNumber(value: x.mcp),
       "result": x.result as NSString,
       "id": x.id as NSString      ]
  }

  static func makeFromCSV(lines: String) -> [Classification]
  { var res : [Classification] = [Classification]()

    if lines.count == 0
    { return res }

    let rows : [String] = Ocl.parseCSVtable(rows: lines)

    for (_,row) in rows.enumerated()
    { if row.count == 0 {
    //ok
    }
      else
      { let x : Classification? = parseCSV(line: row)
        if (x != nil)
        { res.append(x!) }
      }
    }
    return res
  }
}
