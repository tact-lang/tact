struct OptionalDeep {
  x: Int?;
}

struct Container {
  v: OptionalDeep?;
}

contract TestContract {
  c: Container?;

  init() {
    self.c = Container{
      v: OptionalDeep{ x: null }
    };
  }
}