struct Ints {
  a: Int as uint8;
  b: Int as int64;
  c: Int as uint128;
  d: Int as int257;
}

contract IntSerializeTest {
  val: Ints;

  init() {
    self.val = Ints{a:1,b:-2,c:3,d:-4};
  }
}
