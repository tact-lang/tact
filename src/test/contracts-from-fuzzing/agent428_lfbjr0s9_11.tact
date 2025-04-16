// Many persistent fields with mixed types
contract TestContract {
    f1: Bool = false;
    f2: Int = 1;
    f3: String = "hi";
    f4: Bool = true;
    f5: Int? = null;
    f6: String? = null;
    f7: Bool? = null;
    f8: Int = -1;
    f9: String = "bye";
    f10: Bool = true;

    init() {
        self.f1 = true;
        self.f2 = 2;
        self.f3 = "hello";
        self.f4 = false;
        self.f5 = 5;
        self.f6 = "optional";
        self.f7 = false;
        self.f8 = -8;
        self.f9 = "world";
        self.f10 = false;
    }
}