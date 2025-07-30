struct OptionalOnlyInner {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct ContainerOptional {
  value: OptionalOnlyInner;
}

contract WrapperOptional {
  w: ContainerOptional;

  init() {
    self.w = ContainerOptional{
      value: OptionalOnlyInner{
        a: null,
        b: null,
        c: null
      }
    };
  }
}
