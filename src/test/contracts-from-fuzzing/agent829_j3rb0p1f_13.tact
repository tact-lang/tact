struct LongStruct {
  f1: Int;
  f2: Bool;
  f3: Int;
  f4: String;
  f5: Bool?;
  f6: Int?;
  f7: String?;
  f8: Bool;
  f9: Int;
  f10: String;
  f11: Int?;
}

contract LongStorage {
  field: LongStruct;

  init() {
    self.field = LongStruct{
      f1:1, f2:false, f3:3, f4:"a", f5:true, f6:null, f7:null, f8:true, f9:9, f10:"b", f11:11
    };
  }
}