struct Child {
  x: String;
}

struct Parent {
  child: Child;
  comment: String;
}

contract NestedStrings {
  info: Parent;

  init() {
    self.info = Parent{
      child: Child{x: "nested"},
      comment: "parent string"
    };
  }
}
