contract PartialInit {
  x: Int = 1;
  y: String;

  init() {
    self.y = "Set";
  }
}
