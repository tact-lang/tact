struct P {
    a: Int;
}

contract TestContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: String?;
    f5: Bool?;
    f6: Int?;
    f7: P;
    f8: P?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "x";
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.f7 = P{ a: 10 };
        self.f8 = null;
    }
}