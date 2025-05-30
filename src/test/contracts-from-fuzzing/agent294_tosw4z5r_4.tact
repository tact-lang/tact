contract WideFields {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "a";
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int = 42;
    f8: Bool = false;
    f9: String = "hello";
    f10: Int?;

    init() {
        self.f4 = -1;
        self.f5 = null;
        self.f6 = null;
        self.f10 = 999;
    }
}
