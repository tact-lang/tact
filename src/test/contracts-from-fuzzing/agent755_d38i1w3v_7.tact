struct A { foo: Int; bar: Int; }
struct B { foo: Int; bar: Int; }

contract SameFieldNames {
  x: A;
  y: B;

  init() {
    self.x = A{foo:1,bar:2};
    self.y = B{foo:3,bar:4};
  }
}