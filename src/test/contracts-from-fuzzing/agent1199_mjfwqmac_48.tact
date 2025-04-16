struct OptionalMixed {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Int;
  e: String;
  f: Bool;
}

contract Test48 {
  mix: OptionalMixed;

  init() {
    self.mix = OptionalMixed{
      a:null,b:null,c:null,
      d:5,e:"opt",f:true
    };
  }
}