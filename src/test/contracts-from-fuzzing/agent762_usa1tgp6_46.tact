struct OuterStruct {
  innerInt: Int;
  innerBool: Bool;
  innerStr: String;
}

contract OnlyStructField {
  f: OuterStruct;

  init() {
    self.f = OuterStruct { innerInt:5, innerBool:true, innerStr:"hi" };
  }
}