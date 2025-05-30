struct Leaf {
  intv: Int? = null;
  boolv: Bool? = null;
  strv: String? = null;
  addrv: Address? = null;
}

struct Root {
  leaf: Leaf = Leaf{};
  flag: Bool = false;
}

contract Test {
  s: Root;

  init() {
    self.s = Root{};
  }
}
