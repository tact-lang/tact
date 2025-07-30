struct Level3 {
  val: Int;
}

struct Level2 {
  inner: Level3;
}

struct Level1 {
  inner: Level2;
}

contract Test {
  receive() {}
}