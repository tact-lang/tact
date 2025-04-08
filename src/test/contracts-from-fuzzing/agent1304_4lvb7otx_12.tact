struct LongString {
  s: String = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
}

contract LongStringTest {
  strct: LongString;

  init() {
    self.strct = LongString{};
  }
}