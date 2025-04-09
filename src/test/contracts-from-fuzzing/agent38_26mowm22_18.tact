struct Level3 {
  val: Int?;
}

struct Level2 {
  val: Int?;
  next: Level3?;
}

struct Level1 {
  val: Int?;
  next: Level2?;
}

contract TestContract {
  s: Level1;
  init() {
    self.s = Level1{
      val: 1,
      next: Level2{
        val: 2,
        next: Level3{
          val: 3
        }
      }
    };
  }
}
