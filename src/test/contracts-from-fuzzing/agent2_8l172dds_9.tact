// Optional deeply nested struct inside persistent state
struct Deep {
  val: Int;
}

contract Test {
  data: Deep?;

  init() {
    self.data = null;
  }
}