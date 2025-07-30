struct BadSerialization {
  foo: Int as uint4;
}

contract RangeFailTest {
  data: BadSerialization;

  init() {
    self.data = BadSerialization{foo:16};
  }
}