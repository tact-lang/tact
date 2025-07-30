struct Nullables {
  i: Int?;
  b: Bool?;
  s: String?;
}

contract NullOptTest {
  val: Nullables;

  init() {
    self.val = Nullables{ i: null, b: null, s: null };
  }
}