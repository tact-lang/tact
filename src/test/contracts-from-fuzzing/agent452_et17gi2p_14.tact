struct StrMix {
  s: String;
  optS: String?;
}

contract MixStrings {
  storage: StrMix;

  init() {
    self.storage = StrMix{
      s: "hello",
      optS: null,
    };
  }
}