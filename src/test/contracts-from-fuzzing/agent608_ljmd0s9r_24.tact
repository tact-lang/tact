struct S1 { a: Int }
struct S2 { 
  s1: S1 = S1{ a: 99 };
}

contract StructNestedDefault {
  foo: S2;

  init() {
    self.foo = S2{};
  }
}
