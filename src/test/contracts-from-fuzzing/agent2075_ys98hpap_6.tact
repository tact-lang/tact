struct Param {
    a: Int;
}

contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: Int;
    f6: Bool;
    f7: Int;
    f8: Bool;
    f9: Int;
    f10: Bool;
    param: Param;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = 3;
        self.f4 = false;
        self.f5 = 5;
        self.f6 = true;
        self.f7 = 7;
        self.f8 = false;
        self.f9 = 9;
        self.f10 = true;
        self.param = Param{ a: 100 };
    }
}