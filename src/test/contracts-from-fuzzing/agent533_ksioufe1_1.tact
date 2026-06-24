struct Nested1 {
  a: Int;
}

struct Nested2 {
  x: Int;
  nest: Nested1;
}

contract TestContract {
  val: Nested2;

  init() {
    self.val = Nested2{
      x: 1,
      nest: Nested1{a: 2},
    };
  }
}
