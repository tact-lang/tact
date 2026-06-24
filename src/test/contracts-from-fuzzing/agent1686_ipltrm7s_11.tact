struct OptDeep {
  inner: Int?;
}

struct OptOuter {
  nested: OptDeep?;
}

contract OptNestTest {
  data: OptOuter;

  init() {
    self.data = OptOuter{
      nested: null
    };
  }
}