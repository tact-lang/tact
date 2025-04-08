struct L {
  i: Int;
}

struct M {
  l: L;
}

contract Test {
  arr: M;
  init() {
    self.arr = M{ l: L{ i:123 } };
  }
}