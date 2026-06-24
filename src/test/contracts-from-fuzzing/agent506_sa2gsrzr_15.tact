struct Sibling1 {
  a: Int;
}

struct Sibling2 {
  b: Bool;
}

struct Parent {
  child1: Sibling1;
  child2: Sibling2;
}

contract MultiSibling {
  state: Parent;

  init() {
    self.state = Parent{
      child1: Sibling1{a:1},
      child2: Sibling2{b:true}
    };
  }
}