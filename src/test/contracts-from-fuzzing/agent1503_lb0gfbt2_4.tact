contract LongFields {
    f01: Int;
    f02: Bool;
    f03: Address;
    f04: String;
    f05: Int;
    f06: Bool;
    f07: Address;
    f08: String;
    f09: Int;
    f10: Bool;
    f11: Address;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: Address;
    f16: String;

    init() {
        self.f01 = 1;
        self.f02 = true;
        self.f03 = myAddress();
        self.f04 = "x";
        self.f05 = 2;
        self.f06 = false;
        self.f07 = myAddress();
        self.f08 = "y";
        self.f09 = 3;
        self.f10 = true;
        self.f11 = myAddress();
        self.f12 = "z";
        self.f13 = 4;
        self.f14 = false;
        self.f15 = myAddress();
        self.f16 = "w";
    }

    receive() {}
}