// now test serialization with optional inner structs and defaults
struct Inner {
  i: Int as uint32;
  flag: Bool = false;
}

struct Outer {
  inner: Inner? = null;
  value: Int;
}

contract SerialOptDefaults {
  data: Outer;
  init() {
    self.data = Outer{
      inner: null,
      value: 5,
    };
  }
}