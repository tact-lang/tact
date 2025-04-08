struct Child {
  x: Int;
}

struct Parent {
  child: Child?;
}

contract OptInStruct {
  data: Parent;
  init() {
    self.data = Parent{ child: null };
  }
  receive() {}
}