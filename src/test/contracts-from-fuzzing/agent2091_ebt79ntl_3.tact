contract BuilderField {
  b: Builder;

  init() {
    self.b = beginCell();
  }
}