struct OptionalInNested {
  x: Int;
  y: Bool?;
}

struct OuterOptional {
  inner: OptionalInNested?;
  flag: Bool;
}

contract OptionalNestedFields {
  s: OuterOptional;
  init() {
    self.s = OuterOptional{
      inner: null,
      flag: true
    };
  }
}