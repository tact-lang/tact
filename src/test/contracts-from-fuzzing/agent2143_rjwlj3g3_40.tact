struct Wrapper {
  inner: InnerOptional;
}

struct InnerOptional {
  foo: Int?;
}

contract WrapperOptional {
  val: Wrapper;

  init() {
    self.val = Wrapper{inner: InnerOptional{foo: null}};
  }
}