struct X {
  f1: Int;
  f2: Bool?;
  f3: Int?;
  f4: Bool;
  f5: Int;
  f6: Bool?;
}

contract OrderOptionalMix {
  state: X;

  init() {
    self.state = X{
      f1: 42,
      f2: null,
      f3: null,
      f4: true,
      f5: 7,
      f6: false
    };
  }
}