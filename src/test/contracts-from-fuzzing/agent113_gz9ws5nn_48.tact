struct Compose1 {
  x: Int;
}
struct Compose2 {
  y: Int;
}
struct Both {
  c1: Compose1;
  c2: Compose2;
}

contract ComposeTest {
  val: Both;

  init() {
    self.val = Both{ c1: Compose1{x:1}, c2: Compose2{y:2} };
  }
}