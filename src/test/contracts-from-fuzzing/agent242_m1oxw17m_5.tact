struct DeepNestedOptional {
  f1: Int?;
  f2: DeepInner?;
}

struct DeepInner {
  g1: Bool;
  g2: InnerMost?;
}

struct InnerMost {
  x: String;
  y: Bool?;
}

contract OptDeepTest {
  data: DeepNestedOptional;

  init() {
    self.data = DeepNestedOptional{
      f1: 10,
      f2: DeepInner{
        g1: true,
        g2: InnerMost{
          x: "abc",
          y: false,
        },
      },
    };
  }
}