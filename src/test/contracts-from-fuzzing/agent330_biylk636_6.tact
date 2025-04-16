struct Child1 {
  x: Int;
}

struct Child2 {
  y: Bool;
}

struct Parent {
  c1: Child1;
  c2: Child2;
}

contract NestedContract {
  data: Parent;
  init() {
    self.data = Parent {
      c1: Child1 { x:1 },
      c2: Child2 { y:true }
    };
  }
}
