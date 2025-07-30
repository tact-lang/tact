struct LargeStruct {
  x1: Int;
  x2: Bool;
  x3: String;
  x4: Int?;
  x5: Bool?;
  x6: String;
  x7: Int;
  x8: Bool;
  x9: String;
  x10: Int;
}

contract LargeStructField {
  big: LargeStruct;

  init() {
    self.big = LargeStruct{
      x1:1, x2:true, x3:"abc", x4:null, x5:null, x6:"def", x7:7, x8:false, x9:"ghi", x10:10
    };
  }
}
