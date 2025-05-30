contract OptStrInit {
  s: String? = "hello";

  receive() {
    self.s = self.s;
  }
}