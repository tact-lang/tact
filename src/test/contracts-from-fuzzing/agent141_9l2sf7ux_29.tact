struct ManyOptional {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract ManyOptFields {
    m: ManyOptional;

    init() {
      self.m = ManyOptional{};
    }
}