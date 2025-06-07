struct OptionalStringMix {
  s1: String?;
  s2: String;
  s3: String?;
  s4: String;
}

contract StringMixTest {
  data: OptionalStringMix;

  init() {
    self.data = OptionalStringMix{
      s1: null,
      s2: "hi",
      s3: null,
      s4: "there"
    };
  }
}