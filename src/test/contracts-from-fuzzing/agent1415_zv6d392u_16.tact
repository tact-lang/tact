struct DeepDefaults {
  sub: DefaultVals;
}

struct DefaultVals {
  a: Int = 10;
  b: Bool = true;
  c: String = "hello";
  d: Address;
}

contract TestContract {
  d: DeepDefaults;

  init() {
    self.d = DeepDefaults{
      sub: DefaultVals{
        d: myAddress(),
      },
    };
  }
}