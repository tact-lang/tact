struct MixOptional {
  a: Int?;
  b: Bool;
  c: String?;
  d: Address;
}

contract MixOptionalFields {
  data: MixOptional;

  init() {
    self.data = MixOptional{
      a: null, b: true, c: null, d: myAddress()
    };
  }
}