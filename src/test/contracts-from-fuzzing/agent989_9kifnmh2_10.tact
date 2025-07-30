struct OptDeepOptional {
  nested: OptInner?;
}

struct OptInner {
  flag: Bool;
  info: String?;
}

contract OptDeepTest {
  data: OptDeepOptional;

  init() {
    self.data = OptDeepOptional{
      nested: OptInner{ flag: true, info: null }
    };
  }
}