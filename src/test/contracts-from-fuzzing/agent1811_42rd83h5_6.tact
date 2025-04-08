struct DeepOptionals {
  a: Int?;
  b: Bool?;
  c: Inner?;
}

struct Inner {
  x: Int?;
  y: Bool?;
}

contract TestDeepOptional {
  val: DeepOptionals;

  init() {
    self.val = DeepOptionals{
      a: null,
      b: true,
      c: Inner{
        x: null,
        y: false
      }
    };
  }
}
