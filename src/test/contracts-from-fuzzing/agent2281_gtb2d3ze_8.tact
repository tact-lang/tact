struct HasOptional {
  a: Int?;
  b: String?;
  c: Bool?;
}

contract OptionalStructFields {
  data: HasOptional;

  init() {
    self.data = HasOptional{ a:null, b:null, c:null };
  }
}