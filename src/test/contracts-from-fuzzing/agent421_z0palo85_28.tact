struct S1 {
  x: Int? = null;
}

struct S2 {
  y: S1?;
}

contract OptionalStructsWithDefaults {
  val: S2;

  init() {
    self.val = S2 {
      y: null
    };
  }
}