struct EndingRem {
  a: Int;
  b: Cell as remaining;
}

contract GoodRem {
  s: EndingRem;

  init() {
    self.s = EndingRem{ a:1, b:emptyCell() };
  }
}