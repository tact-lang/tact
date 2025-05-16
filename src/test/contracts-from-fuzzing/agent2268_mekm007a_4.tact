struct OptionalDeep {
  nested: InnerMost?;
}

struct InnerMost {
  value: Int;
}

contract OptionalDeepTest {
  data: OptionalDeep;

  init() {
    self.data = OptionalDeep {
      nested: null
    };
  }
}