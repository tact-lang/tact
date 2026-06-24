struct Mix {
  s: String;
  b: Bool;
  n: Int;
  optStr: String?;
  optInt: Int?;
  optBool: Bool?;
}

contract ManyTypes {
  d: Mix;
  init() {
    self.d = Mix{
      s:"hi",
      b:true,
      n:42,
      optStr:null,
      optInt:99,
      optBool:false,
    };
  }
}