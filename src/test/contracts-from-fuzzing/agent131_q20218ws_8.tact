struct Tuple {
  first: Int;
  second: Int?;
  third: String;
}

contract DeepDefaults {
  pair: Tuple = Tuple{ first: 5, second: null, third: "ok" };

  init() {
    self.pair = Tuple{ first: 42, second: null, third: "init" };
  }
}