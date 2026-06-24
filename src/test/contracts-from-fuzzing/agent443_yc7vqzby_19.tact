struct OptionalStructInner {
  x: Int;
}

struct OptionalStruct {
  data: OptionalStructInner?;
}

contract OptStructTest {
  s: OptionalStruct;

  init() {
    self.s = OptionalStruct{
      data: null
    };
  }
}