struct Chain3 {
  lvl1: Lvl1;
}

struct Lvl1 {
  lvl2: Lvl2;
}

struct Lvl2 {
  lvl3: Lvl3;
}

struct Lvl3 {
  v: Int;
}

contract Test17 {
  ch: Chain3;

  init() {
    self.ch = Chain3{lvl1: Lvl1{lvl2: Lvl2{lvl3: Lvl3{v: 42}}}};
  }
}