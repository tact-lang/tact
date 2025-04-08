struct EmptyDefaults {
  a: Int?;
  b: Bool?;
}

contract DefaultsNull {
  data: EmptyDefaults;

  init() {
    self.data = EmptyDefaults{
      a: null,
      b: null
    };
  }
}