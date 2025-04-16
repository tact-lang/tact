struct OuterMost {
  inner: Inner?;
}

struct Inner {
  inner2: Inner2?;
}

struct Inner2 {
  x: Int?;
}

contract DeepOpt {
  field: OuterMost;

  init() {
    self.field = OuterMost{
      inner: Inner{
        inner2: Inner2{
          x: null
        }
      }
    };
  }
}