struct ManyOptionalStructs {
  a: Inner?;
  b: Inner?;
  c: Inner?;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract OptionalNest {
  val: ManyOptionalStructs;
  init() {
    self.val = ManyOptionalStructs{
      a: null,
      b: null,
      c: null
    };
  }
}