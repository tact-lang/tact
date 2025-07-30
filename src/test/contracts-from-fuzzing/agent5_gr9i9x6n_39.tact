struct OptOptBool {
  flag: Bool?;
}

struct ContainerOpt {
  inner: OptOptBool?;
}

contract NestedOptionalsField {
  foo: ContainerOpt;

  init() {
    self.foo = ContainerOpt{ inner: null };
  }

  receive() {
    if (self.foo.inner != null) {
      let _ = self.foo.inner!!.flag;
    }
  }
}
