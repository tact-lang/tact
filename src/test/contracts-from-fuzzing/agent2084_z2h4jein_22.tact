struct One {
  flag: Bool;
}

struct Two {
  num: Int;
}

contract NestedBoth {
  first: One?;
  second: Two?;
  
  init() {
    self.first = null;
    self.second = null;
  }
}
