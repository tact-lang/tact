struct OptDeep {
  a: Int?;
  b: String?;
  c: Cell?;
  d: Slice?;
  e: Address?;
  f: Bool?;
}

struct Container {
  x: OptDeep?;
}

contract OptionPersist {
  data: Container;

  init() {
    self.data = Container {
      x: null
    };
  }
}