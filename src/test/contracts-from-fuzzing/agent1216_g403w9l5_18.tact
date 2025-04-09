struct AAA {
  x: Int;
}

struct BBB {
  y: Int;
  z: AAA;
}

struct CCC {
  a: BBB;
  b: Bool;
  s: String;
}

contract MultiLayer {
  ccc: CCC;

  init() {
    self.ccc = CCC{
      a: BBB{ y:1, z: AAA{x:2} },
      b: true,
      s: "hello"
    };
  }
}