struct Level3 {
  z: Int?;
}

struct Level2 {
  y: Int;
  lvl3: Level3;
}

struct Level1 {
  x: Bool;
  lvl2: Level2;
}

contract NestedFields {
  persist: Level1;

  init() {
    self.persist = Level1{
      x: true,
      lvl2: Level2{
        y: 7,
        lvl3: Level3{
          z: null
        }
      }
    };
  }
}