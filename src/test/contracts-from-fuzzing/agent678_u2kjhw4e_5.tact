contract LongFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "a";
        self.f4 = myAddress();
        self.f5 = 2;
        self.f6 = true;
        self.f7 = "b";
        self.f8 = myAddress();
        self.f9 = 3;
        self.f10 = false;
    }
}