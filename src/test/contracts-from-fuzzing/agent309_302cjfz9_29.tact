contract LongManyOptionalDirect {
    f1: Int?; f2: Bool?; f3: String?; f4: Address?;
    f5: Int?; f6: Bool?; f7: String?; f8: Address?;

    init() {
        self.f1 = 1; self.f2 = null; self.f3 = "a"; self.f4 = null;
        self.f5 = null; self.f6 = true; self.f7 = null; self.f8 = myAddress();
    }
}