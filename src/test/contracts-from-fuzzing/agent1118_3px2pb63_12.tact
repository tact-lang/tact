struct OptionalStruct {
  inner: Inner?;
}

struct Inner {
  val: Int;
}

contract OptionalStructTest {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{ inner: null };
  }
}