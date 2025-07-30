// Multiple nested struct fields with mixed optionals
struct A { x: Int; y: Bool?; }
struct B { a: A?; z: String; }

contract Test {
  field: B;

  init() {
    self.field = B{
      a: A{x:42,y: null},
      z: "nested"
    };
  }
}