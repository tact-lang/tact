struct Lvl3 {
  leaf: Int = 7;
}

struct Lvl2 {
  inner: Lvl3? = null;
}

struct Lvl1 {
  nested: Lvl2? = null;
}

contract Test {
  data: Lvl1?;

  init() {
    self.data = null;
  }
}