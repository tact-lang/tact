struct Inner {
  flag: Bool;
  info: String;
}

struct Outer {
  inner: Inner;
  description: String;
  count: Int as uint16;
}

contract NestedStorage {
  value: Outer;

  init() {
    self.value = Outer{
      inner: Inner{flag: true, info: "info"},
      description: "desc",
      count: 12
    };
  }
}
