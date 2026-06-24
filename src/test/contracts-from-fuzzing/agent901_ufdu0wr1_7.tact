struct OptionalNest {
  maybeInner: Inner?;
}

struct Inner {
  optInt: Int?;
}

contract TestContract {
  storage: OptionalNest;

  init() {
    self.storage = OptionalNest{
      maybeInner: Inner{
        optInt: null
      }
    };
  }
}