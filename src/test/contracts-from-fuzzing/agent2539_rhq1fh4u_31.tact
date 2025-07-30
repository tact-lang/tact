struct AB {
  a: Int;
  b: Bool;
}

struct CD {
  c: String;
  d: Int;
}

struct EF {
  e: String;
  f: Bool;
}

contract ManyEmbeddedStructs {
  sa: AB;
  sb: CD;
  sc: EF;

  init() {
    self.sa = AB{a:1,b:true};
    self.sb = CD{c:"c", d:2};
    self.sc = EF{e:"e", f:false};
  }
}