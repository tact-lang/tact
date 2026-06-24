contract ManyOptionalFields {
    f1: Int?; f2: Int?; f3: Bool?; f4: Bool?; f5: String?;
    f6: String?; f7: String?; f8: String?; f9: Bool?; f10: Int?;

    init() {
        self.f1 = null;
        self.f2 = 2;
        self.f3 = null;
        self.f4 = true;
        self.f5 = "hello";
        self.f6 = null;
        self.f7 = null;
        self.f8 = "hi";
        self.f9 = false;
        self.f10 = null;
    }
}