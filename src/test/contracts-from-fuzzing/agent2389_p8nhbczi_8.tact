contract OnlyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: String?;
    f5: Address?;
    f6: Slice?;

    init() {
        self.f1 = null; self.f2 = null; self.f3 = null;
        self.f4 = null; self.f5 = null; self.f6 = null;
    }
}