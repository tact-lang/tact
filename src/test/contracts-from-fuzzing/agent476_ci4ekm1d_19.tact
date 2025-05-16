struct Level4Opt {
  last: Int?;
}

struct Level3Opt {
  mid: Level4Opt?;
}

struct Level2Opt {
  next: Level3Opt?;
}

contract NestedOptionChain {
  val: Level2Opt?;

  init() {
    self.val = null;
  }

  receive() {
    if (self.val != null) {
      let _ = self.val!!;
    }
  }
}