struct InnerOpt {
  i: Int?;
}

struct Wrap {
  inner: InnerOpt?;
}

contract TestContract {
  data: Wrap;

  init() {
    self.data = Wrap{
      inner: null
    };
  }
}