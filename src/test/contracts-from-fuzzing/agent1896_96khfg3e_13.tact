struct OptionalDefaults {
  a: Int?; // default null
  b: String? = "text";
  c: Bool? = null;
}

contract MixOptDefaults {
  data: OptionalDefaults;

  init() {
    self.data = OptionalDefaults{
      a: null,
      b: "text",
      c: null
    };
  }
}