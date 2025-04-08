struct Child {
  n: Int;
  m: Bool;
}

struct Parent {
  id: Int;
  child: Child;
}

contract NestedStructOpts {
  s: Parent?;
  init() {
    self.s = null;
  }
}