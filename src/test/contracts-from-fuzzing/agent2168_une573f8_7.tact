contract OptionalInInit {
  data: Int?;
  init() {
    self.data = null;
  }
}