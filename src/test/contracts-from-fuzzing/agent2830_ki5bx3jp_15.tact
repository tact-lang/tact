struct SLong {
  f1: Int;
  f2: Int?;
  f3: Bool;
  f4: String;
  f5: String?;
  f6: Int;
  f7: Bool;
  f8: String;
  f9: Int?;
  f10: Bool;
}

contract LongStruct {
  data: SLong;
  init() {
    self.data = SLong{
      f1:1, f2:null, f3:true, f4:"hi", f5:null,
      f6:5, f7:false, f8:"x", f9:null, f10:true
    };
  }
}