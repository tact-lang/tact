struct Wrapper {
  inner: Inner?;
}

struct Inner {
  foo: Int;
}

contract StorageTest {
  field: Wrapper;
  init() {
    self.field = Wrapper{
      inner: Inner{ foo: 42 }
    };
  }
}