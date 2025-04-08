struct Weird {
  a: String;
  b: Int?;
  c: Bool;
  d: String?;
}

contract OptionString {
  s: Weird;

  init() {
    self.s = Weird{
      a:"hi",
      b:null,
      c:true,
      d:null
    };
  }
}