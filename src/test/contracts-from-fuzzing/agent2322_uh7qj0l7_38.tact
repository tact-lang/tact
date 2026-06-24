contract InitOnly {
  val: Int;
  txt: String;

  init() {
    self.val = -55;
    self.txt = "hey";
  }
}
