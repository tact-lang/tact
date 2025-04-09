struct Inner {
  a: Int = 12;
}

struct Outer {
  field: Inner?;
}

contract OptionalDefaultedStruct {
  x: Outer;

  init() {
    self.x = Outer{ field: null };
  }
}
