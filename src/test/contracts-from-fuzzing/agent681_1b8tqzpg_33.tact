struct A { foo: Int; }
struct B { bar: Int; }

contract MultiFieldDiffStructs {
  a: A;
  b: B;

  init() {
    self.a = A{foo: 5};
    self.b = B{bar: 6};
  }
}