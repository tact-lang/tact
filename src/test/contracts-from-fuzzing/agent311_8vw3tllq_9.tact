struct Level1 {
  val: Int;
  l2: Level2;
}
struct Level2 {
  val: Int;
  l3: Level3;
}
struct Level3 {
  val: Int;
  l4: Level4;
}
struct Level4 {
  val: Int;
}

contract DeepChain {
  data: Level1;

  init() {
    self.data = Level1{
      val: 1,
      l2: Level2{
        val: 2,
        l3: Level3{
          val: 3,
          l4: Level4{val:4}
        }
      }
    };
  }
}