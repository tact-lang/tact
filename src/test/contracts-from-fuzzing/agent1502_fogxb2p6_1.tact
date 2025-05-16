struct Tiny {
  a: Int;
}

contract Test {
  data: Tiny;

  init() {
    self.data = Tiny{a: 1};
  }
}