// Persistent struct with nested structs where some have defaults, others do not
struct DefInner {
  a: Int = 42;
  b: Bool = true;
}

struct PartiallyDefault {
  inner: DefInner;
  note: String;
}

contract PartialDefaults {
  data: PartiallyDefault;

  init() {
    self.data = PartiallyDefault{
      inner: DefInner{},
      note: "hi"
    };
  }
}
