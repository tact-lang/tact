struct DefaultsAndOptionals {
  a: Int = 7;
  b: Bool = false;
  c: Int?;
  d: Bool?;
}

contract MixedDefaultsOptionals {
  data: DefaultsAndOptionals;

  init() {
    self.data = DefaultsAndOptionals{
      c: null,
      d: null,
    };
  }
}