contract OnlyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Bool?;
    f5: String?;

    init() {
        self.f1 = null;
        self.f2 = 2;
        self.f3 = null;
        self.f4 = true;
        self.f5 = null;
    }
}