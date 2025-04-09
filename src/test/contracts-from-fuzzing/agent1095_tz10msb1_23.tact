struct ManyMixed {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: Int;
  g: Bool;
  h: String;
  i: Int?;
}

contract ComplexMix {
  s: ManyMixed;

  init() {
    self.s = ManyMixed{
      a:1, b:null, c:true, d:false, e:"hi", f:42, g:true, h:"bye", i:null
    };
  }
}