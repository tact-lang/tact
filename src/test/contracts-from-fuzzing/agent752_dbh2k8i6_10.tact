contract OptFields {
  data1: Int?;
  data2: Bool?;
  data3: String?;

  init() {
    self.data1 = null;
    self.data2 = true;
    self.data3 = "hello";
  }
}