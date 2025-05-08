struct Mid {
  deep: Int?;
}

struct Outer {
  a: Int;
  b: String;
  c: Mid;
}

contract OptionalInsideNested {
  field: Outer;
  init() {
    self.field = Outer{
      a: 1,
      b: "s",
      c: Mid{ deep: null }
    };
  }
}