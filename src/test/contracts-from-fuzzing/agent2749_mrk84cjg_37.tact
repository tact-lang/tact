struct Outermost {
  innermost: Inner?;
}

struct Inner {
  s: String?;
}

contract OptOptOpt {
  val: Outermost?;

  init() {
    self.val = null;
  }
}