struct SimpleOpt { a: Int?; }

contract OptionalOverwrite {
  s: SimpleOpt;
  init() {
    self.s = SimpleOpt { a: null };
    self.s = SimpleOpt { a: 42 };
  }
}