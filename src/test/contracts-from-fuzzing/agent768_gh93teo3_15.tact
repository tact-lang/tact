struct Child {
  val: Int;
}

struct Parent {
  child: Child;
}

contract StructChain {
  p: Parent;

  init() {
    self.p = Parent {
      child: Child { val: 123 }
    };
  }
}