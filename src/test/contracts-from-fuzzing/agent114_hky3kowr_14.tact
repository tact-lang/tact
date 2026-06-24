contract LargeFieldContract {
    f1: Int; f2: Bool; f3: String; f4: Address; f5: Int?;
    f6: Bool?; f7: String?; f8: Address; f9: Int;
    f10: Bool;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "a";
        self.f4 = myAddress();
        self.f5 = null;
        self.f6 = null;
        self.f7 = null;
        self.f8 = myAddress();
        self.f9 = 9;
        self.f10 = true;
    }
}