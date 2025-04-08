struct Nasty {
  a: Int;
  b: Bool?;
  c: String;
  d: Int?;
  e: Address;
  f: String?;
  g: Bool;
}

contract TestContract {
  nested: Nasty;

  init() {
    self.nested = Nasty{
      a:1,
      b:null,
      c:"hi",
      d:2,
      e:myAddress(),
      f:null,
      g:true
    };
  }
}