struct Two {
  one: Int;
  two: Int;
}

contract MultiSameType {
  data: Two;

  init() {
    self.data = Two { one:10, two:20 };
  }
}