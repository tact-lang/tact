struct RecA {
  b: RecB;
}

struct RecB {
  c: RecC;
}

struct RecC {
  x: Int;
}

contract Recurse {
  r: RecA;

  init() {
    self.r = RecA{b: RecB{c: RecC{x: 7}}};
  }
}