struct ManyPrimitives {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Int?;
  f: Bool?;
  g: String;
  h: Address;
}

contract ComplexFields {
  s: ManyPrimitives;

  init() {
    self.s = ManyPrimitives{
      a:1,
      b:true,
      c:"test",
      d:myAddress(),
      e:null,
      f:false,
      g:"t",
      h:myAddress()
    };
  }
}