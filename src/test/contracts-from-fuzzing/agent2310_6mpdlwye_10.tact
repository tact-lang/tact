struct Level3 {
  v1: Int;
  v2: Bool?;
}

struct Level2 {
  next: Level3;
  optNext: Level3?;
}

struct Level1 {
  l2: Level2;
  optL2: Level2?;
}

contract MultiLevel {
  storage: Level1;
  init() {
    self.storage = Level1{
      l2: Level2{ next: Level3{v1:1, v2:null}, optNext:null },
      optL2: null
    };
  }
}