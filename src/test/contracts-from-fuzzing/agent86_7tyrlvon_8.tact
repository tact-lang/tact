struct NestedOptionStruct {
  inner: Inner2?;
}

struct Inner2 {
  foo: Int;
  bar: Bool;
}

contract PersistNestedOpt {
  data: NestedOptionStruct;
  init() {
    self.data = NestedOptionStruct{
      inner: Inner2{ foo: 1, bar: true }
    };
  }
}