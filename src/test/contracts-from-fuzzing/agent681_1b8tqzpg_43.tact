struct WrapOpt {
  foo: Int?;
}

contract DefNullWrapOpt {
  data: WrapOpt? = null;

  init() {
    self.data = null;
  }
}