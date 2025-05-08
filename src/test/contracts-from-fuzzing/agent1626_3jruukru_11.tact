struct NestedOption {
  foo: Inner?;
}

struct Inner {
  bar: Inner2?;
}

struct Inner2 {
  baz: Int;
}

contract TestStorage {
  nestedOpt: NestedOption;

  init() {
    self.nestedOpt = NestedOption{
      foo: Inner{ bar: Inner2{ baz: 7 } }
    };
  }
}