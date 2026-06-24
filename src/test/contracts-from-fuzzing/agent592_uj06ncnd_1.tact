struct Inner {
  x: Int;
  y: Bool;
}

contract TestContract {
  point: Inner;
  flag: Bool;
  num: Int;

  init() {
    self.point = Inner{x: 1, y: true};
    self.flag = true;
    self.num = 42;
  }
}