struct Level3 {
  q: Int = 10;
  r: Bool = false;
}

struct Level2 {
  s: Level3 = Level3{};
  t: Int = 5;
}

struct Level1 {
  u: Level2 = Level2{};
  v: Bool = true;
}

contract TestContract {
  x: Level1;
  init() {
    self.x = Level1{
      u: Level2{
        s: Level3{
          q: 77 // only overriding q, keep r default false
        }
        // don't override t
      }
      // don't override v
    };
  }
}