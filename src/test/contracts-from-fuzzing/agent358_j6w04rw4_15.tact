struct Mix {
  i: Int;
  s: String;
  b: Bool;
  optI: Int?;
  optS: String?;
  optB: Bool?;
}

contract FieldsMix {
  f: Mix;

  init() {
    self.f = Mix{
      i: 1,
      s: "s",
      b: true,
      optI: null,
      optS: null,
      optB: null,
    };
  }
}