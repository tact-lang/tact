struct Child {
  a: Int;
}

struct Parent {
  ch: Child;
}

struct GrandParent {
  p: Parent;
}

contract NestedContract {
  data: GrandParent;

  init() {
    self.data = GrandParent{
      p: Parent{
        ch: Child{
          a: 7,
        },
      },
    };
  }
}