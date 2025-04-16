struct DefaultsAndOverrides {
  a: Int = 42;
  b: String = "foo";
  c: Bool? = null;
}

contract Overrides {
  myVal: DefaultsAndOverrides;

  init() {
    self.myVal = DefaultsAndOverrides{
      a: 99,
      b: "bar",
      c: true
    };
  }
}
