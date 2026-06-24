contract OptionalSerialize {
    a: Int?;
    s: String?;
    b: Bool?;
  
    init() {
        self.a = null;
        self.s = "test";
        self.b = null;
    }
}