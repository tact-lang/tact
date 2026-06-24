struct OptionalStruct {
  nested: Inner?;
}

struct Inner {
  val: Int;
}

contract StorageTest {
  x: OptionalStruct;
  init() {
    self.x = OptionalStruct{
      nested: null
    };
  }
}