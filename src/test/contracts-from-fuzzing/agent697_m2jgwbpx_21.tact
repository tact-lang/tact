struct Sublvl1 {
  a: Int;
  b: Bool?;
}

struct Sublvl2 {
  c: Int?;
  d: String;
}

struct Sublvl3 {
  e: Bool;
  f: String?;
}

struct DeepTree {
  one: Sublvl1;
  two: Sublvl2;
  three: Sublvl3;
}

contract Test {
  val: DeepTree = DeepTree{
    one: Sublvl1{ a: 1, b: null },
    two: Sublvl2{ c: null, d: "text" },
    three: Sublvl3{ e: false, f: null }
  };

  init() {
    self.val = DeepTree{
      one: Sublvl1{ a: 42, b: true },
      two: Sublvl2{ c: 10, d: "change" },
      three: Sublvl3{ e: true, f: "str" }
    };
  }

  receive() {}
}