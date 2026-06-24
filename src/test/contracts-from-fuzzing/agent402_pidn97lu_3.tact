struct WithDefaults {
  x: Int = 1;
  y: Bool = false;
  z: Nested;
}

struct Nested {
  s: String = "default";
  n: Int?;
}

contract DefaultsTest {
  data: WithDefaults;

  init() {
    self.data = WithDefaults{
      z: Nested{
        n: null,
      },
    };
  }
}