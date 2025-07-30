struct Sub {
  x: Int;
  y: Int;
}

contract DefaultVals {
  sub: Sub = Sub{ x: 5, y: 10 };

  init() {
    self.sub = Sub{ x: 123, y: 456 };
  }
}