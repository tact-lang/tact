struct InnerMost { a: Int; }

struct Level3 { inner: InnerMost; }
struct Level2 { inner: Level3; }
struct Level1 { inner: Level2; }

struct Roots {
  a: Level1;
  b: Level1;
}

contract MultiDeep {
  roots: Roots;

  init() {
    self.roots = Roots{
      a: Level1{ inner: Level2{ inner: Level3{ inner: InnerMost{ a: 1 } } } },
      b: Level1{ inner: Level2{ inner: Level3{ inner: InnerMost{ a: 2 } } } },
    };
  }
}