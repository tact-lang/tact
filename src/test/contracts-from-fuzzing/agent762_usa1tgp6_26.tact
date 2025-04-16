struct RecLevel3 {
  val: Int?;
}

struct RecLevel2 {
  inner: RecLevel3?;
}

struct RecLevel1 {
  inner: RecLevel2?;
}

contract DeepNestOpt {
  root: RecLevel1?;

  init() {
    self.root = null;
  }
}