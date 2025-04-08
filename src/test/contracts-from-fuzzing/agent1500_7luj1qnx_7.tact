contract LongFieldList {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "a";
    f4: Int = 4;
    f5: Int = 5;
    f6: Bool = false;
    f7: String = "b";
    f8: Address;
    f9: Int?;
    f10: String?;

    init() {
        self.f8 = myAddress();
        self.f9 = null;
        self.f10 = null;
    }
}