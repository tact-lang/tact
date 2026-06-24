struct A {
  ref: B?;
}

struct B {
  v: Int;
}

contract Test {
  data: A;

  init() {
    self.data = A{ ref:null };
  }
}
