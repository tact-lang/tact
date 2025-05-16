struct OptIntBool {
  i: Int?;
  b: Bool?;
}

struct DoubleNested {
  w: OptIntBool;
  z: OptIntBool;
}

struct Outer {
  t: DoubleNested;
}

contract NestedOptionals {
  data: Outer;

  init() {
    self.data = Outer{
      t: DoubleNested{
        w: OptIntBool{ i: null, b: true },
        z: OptIntBool{ i: 42, b: null }
      }
    };
  }
}
