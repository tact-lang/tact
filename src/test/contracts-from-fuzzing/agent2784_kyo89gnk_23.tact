struct NestedWithDefaults {
  a: Int = 5;
  b: Bool = true;
}

struct WrapDefaults {
  inner: NestedWithDefaults;
  c: String = "x";
}

contract DefaultsNested {
  data: WrapDefaults;

  init() {
    self.data = WrapDefaults{
      inner: NestedWithDefaults{},
      c: "y"
    };
  }
}