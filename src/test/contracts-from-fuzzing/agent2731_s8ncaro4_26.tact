struct Bunch {
  a: Int;
  b: Int;
  c: Int;
  d: Bool;
  e: String;
  f: Int?;
  g: Bool?;
  h: String?;
}

contract MixedOptionalPrimitives {
  data: Bunch;

  init() {
    self.data = Bunch{
      a:1, b:2, c:3, d:true, e:"hi", f:null, g:null, h:null
    };
  }
}