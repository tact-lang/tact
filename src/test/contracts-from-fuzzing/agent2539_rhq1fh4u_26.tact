struct ZeroNested {
  a: Int;
}

contract DefaultOptTest {
  nest: ZeroNested? = null;

  init() {
    self.nest = ZeroNested{a: 7};
  }
}