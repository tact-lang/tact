// test mix of deeply nested and sibling nested persistent fields
struct Child {
  num: Int;
  flag: Bool?;
}

struct Parent {
  a: Child;
  b: Child?;
  comment: String;
}

contract TestContract {
  parent: Parent;

  init() {
    self.parent = Parent {
      a: Child{ num: 1, flag: null },
      b: null,
      comment: "done"
    };
  }
}