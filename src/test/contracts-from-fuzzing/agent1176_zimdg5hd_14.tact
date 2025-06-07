struct Inner {
  x: Int?;
  y: Bool?;
}

struct Outer {
  inn: Inner;
}

contract OptionalInsideOptional {
  stOpt: Outer?;

  init() {
    self.stOpt = Outer{
      inn: Inner{
        // x and y are null by default
      }
    };
  }
}