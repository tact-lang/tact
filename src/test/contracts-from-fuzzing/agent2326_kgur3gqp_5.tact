struct O1 {
  a: Int?;
}

struct O2 {
  b: O1?;
}

contract Test {
  data: O2;

  init() {
    self.data = O2{
      b: O1{ a: null },
    };
  }
}