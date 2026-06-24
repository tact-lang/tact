struct NestedOptional {
  inner: InnerOpt?;
}

struct InnerOpt {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract ContractOptional {
  data: NestedOptional;

  init() {
    self.data = NestedOptional {
      inner: InnerOpt { x: null, y: true, z: null }
    };
  }
}