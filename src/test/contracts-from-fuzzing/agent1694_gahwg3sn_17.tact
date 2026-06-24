struct OptionalNest {
  f1: Int?;
  f2: Bool?;
  f3: String?;
  f4: Cell?;
  f5: Slice?;
  f6: Address?;
}

struct Wrapper {
  inner: OptionalNest?;
}

contract OptionalInOptional {
  storage: Wrapper;

  init() {
    self.storage = Wrapper{ inner: null };
  }
}