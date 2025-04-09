struct MixStringsAndInts {
  s: String;
  i: Int;
  s2: String;
  i2: Int;
}

contract MixStringsIntsTest {
  storage: MixStringsAndInts;

  init() {
    self.storage = MixStringsAndInts{
      s: "hello",
      i: 100,
      s2: "world",
      i2: 200,
    };
  }
}