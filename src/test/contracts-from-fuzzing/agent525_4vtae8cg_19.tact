struct Child {
  n: Int;
  b: Bool;
}

struct Parent {
  a: Int;
  child: Child;
}

contract NestedDefault {
    rec: Parent;
    init() {
        self.rec = Parent{
            a: 5,
            child: Child{ n: 10, b: true },
        };
    }
}