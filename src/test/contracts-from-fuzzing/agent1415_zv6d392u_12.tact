struct DefaultVals {
  a: Int = 10;
  b: Bool = true;
  c: String = "hello";
  d: Address;
}

contract TestContract {
  d: DefaultVals;

  init() {
    self.d = DefaultVals{
      d: myAddress(),
    };
  }
}