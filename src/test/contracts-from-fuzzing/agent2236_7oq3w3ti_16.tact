struct Lvl3 {
  a: Int;
}

struct Lvl2 {
  b: Bool;
  lvl3: Lvl3;
}

struct Lvl1 {
  c: String;
  lvl2: Lvl2;
}

contract MultiNest {
  root: Lvl1;

  init() {
    self.root = Lvl1{
      c: "hi",
      lvl2: Lvl2{
        b: true,
        lvl3: Lvl3{
          a: 99
        }
      }
    };
  }
}