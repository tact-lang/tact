struct Combo {
  f1: Int = 1;
  f2: Bool?;
  f3: Int?;
  f4: Bool = false;
  f5: Int? = null;
  f6: Bool? = true;
}

contract Test {
  combo: Combo;

  init() {
    self.combo = Combo{
      f2: false,
      f3: 123,
      f5: null
    };
  }
}