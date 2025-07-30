struct Alias {
  a: Int as uint64;
  b: Int as int8;
  c: Int as coins;
}

contract SerializeTest {
  val: Alias;

  init() {
    self.val = Alias{ a: 42, b: -3, c: ton("1") };
  }
}