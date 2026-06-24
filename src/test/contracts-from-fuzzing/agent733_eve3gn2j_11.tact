struct Sub {
  val: Int as int8;
}

struct Wrap {
  x: Int as uint16;
  y: Sub;
}

contract TestContract {
  w: Wrap?;
  init() {
    self.w = Wrap{ x: 1234, y: Sub{ val: -5 } };
  }
}