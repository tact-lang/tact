// test contract with many optional nested struct fields
struct Foo {
  a: Int?;
  b: Bool?;
}

contract OptNestedFields {
  f1: Foo?;
  f2: Foo?;

  init() {
    self.f1 = null;
    self.f2 = null;
  }
}