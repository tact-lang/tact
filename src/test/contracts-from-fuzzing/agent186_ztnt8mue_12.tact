// Deeply nested struct with multi-levels and optional fields
struct Level1 {
  id: Int;
  next: Level2;
}

struct Level2 {
  flag: Bool;
  msg: Level3?;
}

struct Level3 {
  name: String;
  value: Int?;
}

contract TestContract {
  lvl: Level1;
  init() {
    self.lvl = Level1{
      id: 1,
      next: Level2{
        flag: true,
        msg: Level3{ name: "x", value: null }
      }
    };
  }
}