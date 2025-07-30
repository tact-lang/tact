struct NestedStructOpt {
  nest: Int?;
}

struct ContainerOpt {
  inner: NestedStructOpt?;
}

contract NestedOptionalStructs {
  field: ContainerOpt;

  init() {
    self.field = ContainerOpt{ inner: null };
  }
}