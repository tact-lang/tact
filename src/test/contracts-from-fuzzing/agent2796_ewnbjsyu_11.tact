struct Container {
    flag: Bool;
}

contract ManyFieldsContract {
    f1: Int; f2: Bool; f3: Int?; f4: Bool?;
    f5: Int; f6: Bool; f7: Int?; f8: Bool?;
    f9: Int; f10: Bool; f11: Int?; f12: Bool?;
    f13: Int; f14: Bool; f15: Int?; f16: Bool?;
    nestedStruct: Container;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = null;
        self.f4 = false;
        self.f5 = 5;
        self.f6 = true;
        self.f7 = null;
        self.f8 = false;
        self.f9 = 9;
        self.f10 = true;
        self.f11 = null;
        self.f12 = false;
        self.f13 = 13;
        self.f14 = true;
        self.f15 = null;
        self.f16 = false;
        self.nestedStruct = Container{ flag: true };
    }
}