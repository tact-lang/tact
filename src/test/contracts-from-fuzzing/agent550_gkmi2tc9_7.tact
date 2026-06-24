struct DeepOptions {
  lvl1: Lvl1?;
}

struct Lvl1 {
  lvl2: Lvl2?;
}

struct Lvl2 {
  lvl3: Lvl3?;
}

struct Lvl3 {
  lvl4: Lvl4?;
}

struct Lvl4 {
  val: Int?;
}

contract Test {
  st: DeepOptions;
  init() {
    self.st = DeepOptions{ lvl1: null };
  }
}