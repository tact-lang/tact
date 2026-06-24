struct SeveralOptionals {
  a: Int?;
  b: Bool?;
  c: Address?;
}

contract MultiOptTest {
  sopt: SeveralOptionals;

  init() {
    self.sopt = SeveralOptionals{ a: null, b: null, c: null };
  }
}