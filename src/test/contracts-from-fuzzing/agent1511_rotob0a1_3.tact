struct NestedOptionals {
  x: Int?;
  y: Bool?;
  z: String?;
}

struct Container {
  nested: NestedOptionals;
  flag: Bool;
}

contract DeepOptional {
  data: Container;

  init() {
    self.data = Container{
      nested: NestedOptionals{
        x: null,
        y: null,
        z: null,
      },
      flag: true,
    };
  }
}
