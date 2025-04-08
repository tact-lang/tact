struct MixOptional {
  a: Int;
  b: Int?;
  c: Bool;
  d: Bool?;
  e: String;
  f: String?;
  g: Address;
  h: Address?;
}

contract MixOptionalTest {
  storage: MixOptional;

  init() {
    self.storage = MixOptional{
      a: 10,
      b: null,
      c: true,
      d: false,
      e: "hello",
      f: null,
      g: myAddress(),
      h: null,
    };
  }
}