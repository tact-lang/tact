struct Combo {
  a: Int;
  b: Bool;
  c: String;
  d: Bool;
  e: Int;
  f: String;
}

contract MultiPrimitiveStruct {
  s: Combo;

  init() {
    self.s = Combo{ a:1, b:true, c:"hello", d:false, e:99, f:"bye" };
  }
}
