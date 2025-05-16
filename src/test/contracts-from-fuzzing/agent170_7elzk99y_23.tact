// Struct highly nested 3 levels
struct Level1 {
  inner: Level2;
}

struct Level2 {
  inner2: Level3;
}

struct Level3 {
  val: Int;
}

contract DeepNestTest {
  val: Level1;

  init() {
    self.val = Level1{
      inner: Level2{
        inner2: Level3{
          val: 99
        }
      }
    };
  }
}