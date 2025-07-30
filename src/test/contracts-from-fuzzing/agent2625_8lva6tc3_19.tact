contract OnlyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    
    init() {
        self.f1 = 99;
        self.f2 = false;
        self.f3 = "test";
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
    }
}
