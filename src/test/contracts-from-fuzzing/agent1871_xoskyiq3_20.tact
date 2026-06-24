struct DeepOpt {
  inner: InnerOpt?;
}

struct InnerOpt {
  value: Int?;
}

contract DeepOptTest {
  dat: DeepOpt;

  init() {
    self.dat = DeepOpt { inner: null };
  }
}