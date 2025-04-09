struct DefaultsOptional {
  a: Int? = null;
  b: Bool? = true;
  c: String = "default";
  d: Int?
}

contract DefaultOptContract {
  data: DefaultsOptional;

  init() {
    self.data = DefaultsOptional{
      d: 42
    };
  }
}
