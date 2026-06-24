struct A {
  x: Int;
}

struct B {
  y: A?;
}

contract OptStructNested {
  data: B;

  init() {
    self.data = B{y: null};
  }
}