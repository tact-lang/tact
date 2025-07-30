struct Dummy {
    x: Int;
}

contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Dummy;
    f4: String;
    f5: Bool?;
    f6: Int;
    f7: Dummy;
    f8: String?;
    f9: Bool;
    f10: Int;
    f11: Dummy;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = Dummy{ x: 1 };
        self.f4 = "foo";
        self.f5 = null;
        self.f6 = 6;
        self.f7 = Dummy{ x: 7 };
        self.f8 = null;
        self.f9 = true;
        self.f10 = 10;
        self.f11 = Dummy{ x: 11 };
    }
}