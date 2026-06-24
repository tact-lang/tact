struct Level3 {
  f: Int;
}

struct Level2 {
  l3: Level3;
}

struct Level1 {
  l2: Level2;
}

contract TestContract {
  deep: Level1 = Level1{
    l2: Level2{
      l3: Level3{
        f: 11
      }
    }
  };
  init() {}
}