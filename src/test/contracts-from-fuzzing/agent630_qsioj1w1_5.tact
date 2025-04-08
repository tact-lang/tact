struct A {
  foo: Int;
  bar: Bool;
}
struct B {
  a: A;
  baz: String;
}
struct C {
  b: B;
  qux: Address;
}

contract Chain {
  c: C;

  init() {
    self.c = C{
      b: B{
        a: A{
          foo: 123,
          bar: true,
        },
        baz: "hello",
       },
       qux: myAddress(),
    };
  }
}