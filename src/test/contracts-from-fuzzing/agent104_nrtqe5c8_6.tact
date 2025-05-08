struct Child1 {
  v1: Int;
}

struct Child2 {
  v2: Bool;
}

struct Parent {
  f1: Child1;
  f2: Child2;
}

contract SiblingNestedStructs {
  composite: Parent;
  init() {
    self.composite = Parent{
      f1: Child1{v1: 12},
      f2: Child2{v2: true}
    };
  }
}