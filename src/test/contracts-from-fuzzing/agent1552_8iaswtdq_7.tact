struct Rec {
    a: Int;
    b: Bool;
}

contract ManySimpleFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
    f11: Rec;
    f12: Int;
    f13: Bool;
    f14: String;
    f15: Int?;
    f16: Bool?;
    f17: String;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "3";
        self.f4 = null;
        self.f5 = false;
        self.f6 = "6";
        self.f7 = 7;
        self.f8 = true;
        self.f9 = "9";
        self.f10 = null;
        self.f11 = Rec{a:11,b:true};
        self.f12 = 12;
        self.f13 = false;
        self.f14 = "14";
        self.f15 = null;
        self.f16 = true;
        self.f17 = "17";
    }
}