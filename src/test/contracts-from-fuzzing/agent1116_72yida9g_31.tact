// optional struct with optional inside nested optional struct
struct Level1 {
  inner: Int?;
}

struct Level0 {
  lvl1: Level1?;
}

contract OptOptOpt {
  opt: Level0?;

  init() {
    self.opt = Level0{ lvl1: Level1{ inner:null } };
  }
}
