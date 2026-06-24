struct Level3 {
  z: Int = 3;
}

struct Level2 {
  l3: Level3;
}

struct Level1 {
  l2: Level2;
}

contract TestContract {
  nested: Level1 = Level1{ l2: Level2{ l3: Level3{} } };

  init() {}
}