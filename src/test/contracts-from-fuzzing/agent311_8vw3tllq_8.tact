struct LargeStrings {
  a: String;
  b: String;
}

contract StringStor {
  data: LargeStrings;

  init() {
    self.data = LargeStrings{
      a: "a very very long string to test the serialization edgecases........................................................................................................",
      b: "another excessively long string for fuzzing........................................................................................................"
    };
  }
}