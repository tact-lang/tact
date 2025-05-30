struct OptDeep {
  innerOpt: Inner?;
}

struct Inner {
  value: Int;
}

contract TestStorage {
  data: OptDeep;

  init() {
    self.data = OptDeep{
      innerOpt: Inner{ value: 42 }
    };
  }
}