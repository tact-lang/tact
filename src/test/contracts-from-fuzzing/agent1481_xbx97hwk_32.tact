// Struct with optional of primitive and nested struct
struct Child {
  val: Int;
}

struct Parent {
  x: Int?;
  nested: Child?;
}

contract MixedOptTest {
  p: Parent;
  init() {
    self.p = Parent{ x:null, nested:null };
  }
}