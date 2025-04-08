struct DefaultedAndNonDefaulted {
  x: Int = 99;
  y: Int;
}

contract DefaultsMix {
  rec: DefaultedAndNonDefaulted;

  init() {
    self.rec = DefaultedAndNonDefaulted{
      y: 7
    };
  }
}