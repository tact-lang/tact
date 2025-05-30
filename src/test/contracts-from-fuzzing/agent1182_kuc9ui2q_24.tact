struct HasStr {
  s: String;
}

contract OptHasStr {
  val: HasStr?;

  init() {
    self.val = null;
  }
}
