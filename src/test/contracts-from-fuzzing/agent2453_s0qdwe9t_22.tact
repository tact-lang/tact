struct Opts {
  s: String?;
  b: Bool?;
}

struct ContainerOpt {
  inner: Opts?;
}

contract TopLevelNestedOptional {
  field: ContainerOpt;
  init() {
    self.field = ContainerOpt { inner: null };
  }
}