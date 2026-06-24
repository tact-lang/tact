struct MixOpt {
  i: Int;
  optI: Int?;
  b: Bool;
  optB: Bool?;
}

contract MixedOptions {
  data: MixOpt;

  init() {
    self.data = MixOpt{
      i: 1,
      optI: null,
      b: true,
      optB: false
    };
  }
}