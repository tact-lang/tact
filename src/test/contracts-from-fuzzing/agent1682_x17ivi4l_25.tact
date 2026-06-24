struct Parent {
  child: Child;
}

struct Child {
  grandchild: GrandChild;
}

struct GrandChild {
  x: Int;
}

contract TestContract {
  root: Parent;

  init() {
    self.root = Parent{
      child: Child{
        grandchild: GrandChild{
          x: 123
        }
      }
    };
  }
}