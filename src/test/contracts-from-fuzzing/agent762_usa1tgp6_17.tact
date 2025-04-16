contract DefaultOptionalFields {
  name: String?;
  age: Int?;
  flag: Bool?;

  init() {
    self.name = null;
    self.age = null;
    self.flag = null;
  }
}