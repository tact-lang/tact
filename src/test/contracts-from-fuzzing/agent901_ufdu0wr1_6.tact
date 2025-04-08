struct Inner1 { val: Int; }
struct Inner2 { a: Inner1; }
struct Inner3 { b: Inner2; }
struct Inner4 { c: Inner3; }
struct Inner5 { d: Inner4; }

contract TestContract {
  deep: Inner5;

  init() {
    self.deep = Inner5{ d: Inner4{ c: Inner3{ b: Inner2{ a: Inner1{ val: 42 } } } } };
  }
}