struct A {
  i: Int;
}
struct B {
  a: A;
}

contract TestContract {
  field: B?;

  init() {
    self.field = B{ a: A{ i: 42 } };
  }
}