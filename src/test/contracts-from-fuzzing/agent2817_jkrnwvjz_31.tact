struct Lvl3 {
  i: Int;
}

struct Lvl2 {
  obj: Lvl3;
}

struct Lvl1 {
  obj: Lvl2;
}

contract Levels {
  state: Lvl1;

  init() {
    self.state = Lvl1{ obj: Lvl2{ obj: Lvl3{ i: 5 } } };
  }
}
