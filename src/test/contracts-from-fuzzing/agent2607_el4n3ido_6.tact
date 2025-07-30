struct LongStrings {
  a: String;
  b: String;
}

contract LongStringsTest {
  data: LongStrings;

  init() {
    self.data = LongStrings{
      a: "This is a very long string just to test serialization and capacity limits",
      b: "Another very very long string exceeding usual expectations, just fuzzing"
    };
  }
}
