struct SingleOptional {
  foo: Int?;
}

contract OptTest {
  val: SingleOptional;

  init() {
    self.val = SingleOptional{foo: null};
  }
}