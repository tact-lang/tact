struct Weird {
  foo: Int?;
  bar: String;
}

contract WeirdDefaults {
  data: Weird = Weird{ foo: null, bar: "abc" };

  init() {
    self.data = Weird{ foo: 42, bar: "def" };
  }
}