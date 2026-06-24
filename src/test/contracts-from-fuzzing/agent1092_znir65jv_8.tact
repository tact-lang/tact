struct Arr {
  one: Int;
  two: Int;
  three: Int;
  four: Int;
}

contract OrderCheck {
  data: Arr;

  init() {
    self.data = Arr{
      three:3,
      one:1,
      four:4,
      two:2
    };
  }
}
