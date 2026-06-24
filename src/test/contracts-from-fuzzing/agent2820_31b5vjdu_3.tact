struct C {
  foo: Int;
  bar: Bool?;
}

struct B {
  baz: C;
  qux: Int?;
}

struct A {
  nested: B;
  val: Int;
}

contract DeeplyNestedTest {
  data: A;

  init() {
    self.data = A{
      nested: B{
        baz: C{foo: 42, bar: null},
        qux: null
      },
      val: 7
    };
  }
}