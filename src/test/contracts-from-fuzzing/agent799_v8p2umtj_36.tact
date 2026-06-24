// large number of contract fields of mixed types
contract BigMixed {
    f01: Int = 1;
    f02: Bool = false;
    f03: String = "a";
    f04: Int? = null;
    f05: Bool? = null;
    f06: String? = null;
    f07: Int = 7;
    f08: Bool = true;
    f09: String = "b";
    f10: Int? = null;
    f11: Bool? = null;
    f12: String? = null;

    init() {
        self.f04 = 4;
        self.f05 = true;
        self.f06 = "c";
        self.f10 = 10;
        self.f11 = false;
        self.f12 = "d";
    }
}