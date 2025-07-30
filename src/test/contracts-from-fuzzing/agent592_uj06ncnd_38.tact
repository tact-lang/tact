struct Sub {
  s: String;
}

contract OptStructStrings {
  val: Sub?;
  init() {
    self.val = null;
  }
}