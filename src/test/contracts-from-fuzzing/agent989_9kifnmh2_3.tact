struct Level3 {
  x: Int;
  y: Bool;
}
struct Level2 {
  lvl3: Level3;
  message: String;
}
struct Level1 {
  lvl2: Level2;
  flag: Bool;
}

contract VeryDeep {
  data: Level1;

  init() {
    self.data = Level1{
      lvl2: Level2{
        lvl3: Level3{ x: 42, y: true },
        message: "hello"
      },
      flag: false
    };
  }
}