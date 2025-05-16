contract UninitOpt {
  val: String?;

  receive() {
    if (self.val == null) {
      self.val = "late";
    }
  }
}