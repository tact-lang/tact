// Struct with default nested in default nested in default
struct Lvl3 { q: Int = 3; }
struct Lvl2 { l3: Lvl3 = Lvl3{}; }
struct Lvl1 { l2: Lvl2 = Lvl2{}; }

contract ChainDefaults {
  x: Lvl1;

  init() {
    self.x = Lvl1{};
  }
}
