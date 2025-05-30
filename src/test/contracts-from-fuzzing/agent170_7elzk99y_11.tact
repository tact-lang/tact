struct OptionalStruct {
  nested: Inner?;
}

struct Inner {
  a: Int;
  b: Int?;
}

contract OptionalStructTest {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      nested: Inner{
        a: 5,
        b: null
      }
    };
  }
}