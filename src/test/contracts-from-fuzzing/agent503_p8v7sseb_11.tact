struct MixedMany {
  x: Int;
  y: Bool;
  z: String;
  addr: Address;
  optX: Int?;
  optY: Bool?;
  optStr: String?;
  optAddr: Address?;
}

contract ManyMix {
  data: MixedMany;

  init() {
    self.data = MixedMany{
      x: 1,
      y: false,
      z: "test",
      addr: myAddress(),
      optX: null,
      optY: true,
      optStr: null,
      optAddr: null
    };
  }
}
