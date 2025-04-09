struct OptionalNested {
  a: Int?;
  b: Bool;
  c: String?;
}

struct Container {
  optNest: OptionalNested?;
  flag: Bool;
}

contract Test {
  value: Container;

  init() {
    self.value = Container{
      optNest: null,
      flag: true
    };
  }
}