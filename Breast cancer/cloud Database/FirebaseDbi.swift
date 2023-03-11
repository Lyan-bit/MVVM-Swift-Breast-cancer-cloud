import UIKit
import FirebaseAuth
import FirebaseDatabase

class FirebaseDbi
{ static var instance : FirebaseDbi? = nil
  var database : DatabaseReference? = nil

  static func getInstance() -> FirebaseDbi
  { if instance == nil
    { instance = FirebaseDbi() }
    return instance!
  }

  init() {
      connectByURL("https://classification-27cf8-default-rtdb.asia-southeast1.firebasedatabase.app/")
  }

  func connectByURL(_ url: String)
  { self.database = Database.database(url: url).reference()
    if self.database == nil
    { print("Invalid database url")
      return
    }
    self.database?.child("classifications").observe(.value,
      with:
      { (change) in
        var keys : [String] = [String]()
        if let d = change.value as? [String : AnyObject]
        { for (_,v) in d.enumerated()
          { let einst = v.1 as! [String : AnyObject]
            let ex : Classification? = ClassificationDAO.parseJSON(obj: einst)
            keys.append(ex!.id)
          }
        }
        var runtimepersons : [Classification] = [Classification]()
        runtimepersons.append(contentsOf: classificationAllInstances)

        for (_,obj) in runtimepersons.enumerated()
        { if keys.contains(obj.id) {
          //check
          }
          else
          { killClassification(key: obj.id) }
        }
      })
  }

  func persistClassification(ex : Classification)
  { let evo = ClassificationDAO.writeJSON(x: ex)
    if let newChild = self.database?.child("classifications").child(ex.id)
    { newChild.setValue(evo) }
  }
  
  func deleteClassification(ex : Classification)
  { if let oldChild = self.database?.child("classifications").child(ex.id)
    { oldChild.removeValue() }
  }

}
