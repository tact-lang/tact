struct OptionalSerialize {
  a: Int? as uint32;
  b: Int? as int8;
}

contract OptSerTest {
  data: OptionalSerialize;

  init() {
    self.data = OptionalSerialize{ a: null, b: null };
  }
}
