struct Lvl3 {
  x: Int;
}

struct Lvl2 {
  lvl3: Lvl3;
}

struct Lvl1 {
  lvl2: Lvl2;
}

contract Test {
  data: Lvl1;

  init() {
    self.data = Lvl1{
      lvl2: Lvl2{
        lvl3: Lvl3{
          x: 999,
        },
      },
    };
  }
}