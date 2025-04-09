contract DefaultNilOpt {
  id: Int?;
  note: String?;

  init() {
    self.id = null;
    self.note = null;
  }
}