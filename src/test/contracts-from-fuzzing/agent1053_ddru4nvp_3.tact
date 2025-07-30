struct Inner {
  foo: Int;
  bar: Bool;
}

struct Wrapper {
  nested: Inner?;
  count: Int;
}

contract OptNestedStruct {
  data: Wrapper;

  init() {
    self.data = Wrapper{
      nested: null,
      count: 10,
    };
  }
}