struct Level3 {
  q: String?;
}

struct Level2 {
  r: Level3?;
  s: String;
}

struct Level1 {
  t: Level2?;
}

contract OptDeep {
  nestedOpt: Level1;

  init() {
    self.nestedOpt = Level1{
      t: Level2{
        r: Level3{q:"Hi"},
        s: "hello"
      }
    };
  }
}
