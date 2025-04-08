struct WithZero {
  someInt: Int as uint4;
}

contract ZeroAssign {
  st: WithZero;

  init() {
    self.st = WithZero{someInt: 0};
  }
}