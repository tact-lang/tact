contract OptionalScalars {
  age: Int?;
  active: Bool?;
  nickname: String?;

  init() {
    self.age = 28;
    self.active = null;
    self.nickname = "Tac";
  }
}