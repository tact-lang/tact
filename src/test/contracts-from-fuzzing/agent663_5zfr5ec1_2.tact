struct A {
  foo: Int;
  bar: Bool;
}

struct B {
  inner: A;
  flag: Bool;
}

struct C {
  inner: B;
  amount: Int;
}

contract DeeplyNested {
  field: C;

  init() {
    self.field = C{
      inner: B{
        inner: A{foo: 10, bar: false},
        flag: true
      },
      amount: 42
    };
  }
}