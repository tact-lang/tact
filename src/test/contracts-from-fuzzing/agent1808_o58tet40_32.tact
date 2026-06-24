struct OptStringContainer {
  s: String?;
}

struct OptOptString {
  inner: OptStringContainer?;
}

contract OptOptTest {
  dat: OptOptString;

  init() {
    self.dat = OptOptString{
      inner: OptStringContainer{ s: null }
    };
  }
}