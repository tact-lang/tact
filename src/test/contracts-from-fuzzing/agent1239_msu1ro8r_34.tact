struct DeepInit {
  i: Int;
  s: String;
}

contract DeepDefaults {
  f: DeepInit;

  init() {
    self.f = DeepInit { i: 42, s: "deep" };
  }
}