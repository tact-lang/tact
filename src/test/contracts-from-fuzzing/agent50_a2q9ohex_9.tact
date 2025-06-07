contract OnlyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
    }
}