struct OptStr {
  s: String?;
}

contract NullStructOpt {
  val: OptStr?;

  init() {
    self.val = null;
  }
}