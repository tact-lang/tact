struct A {
  foo: Int;
}

struct B {
  bar: Int?;
  inner: A;
}

struct C {
  baz: Bool;
  nested: B;
}

contract NestedContract {
  state: C;

  init() {
    self.state = C{baz:true, nested: B{bar:null, inner: A{foo: 42}}};
  }
}