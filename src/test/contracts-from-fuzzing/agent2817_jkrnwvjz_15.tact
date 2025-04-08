struct InnerA {
  a: Int;
}

struct InnerB {
  b: Bool;
}

struct InnerC {
  c: String;
}

struct Mixed {
  one: InnerA;
  two: InnerB;
  three: InnerC;
}

contract HasMixed {
  m: Mixed;

  init() {
    self.m = Mixed{
      one: InnerA{a:1},
      two: InnerB{b:true},
      three: InnerC{c:"c"}
    };
  }
}
