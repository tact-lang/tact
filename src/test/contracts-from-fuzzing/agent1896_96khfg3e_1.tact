contract SingleField {
  only: String;

  init() {
    self.only = "test";
  }
}