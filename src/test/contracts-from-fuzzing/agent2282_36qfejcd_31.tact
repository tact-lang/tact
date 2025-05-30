struct DefaultVals {
  i: Int = 123;
  b: Bool = true;
  s: String = "hi";
}

contract Test27 {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{};
    }
}