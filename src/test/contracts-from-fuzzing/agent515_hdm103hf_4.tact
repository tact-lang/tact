struct Simple {
    x: Int;
}

contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: Int?;
    f10: String;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "3";
        self.f4 = null;
        self.f5 = true;
        self.f6 = "hello";
        self.f7 = 7;
        self.f8 = false;
        self.f9 = null;
        self.f10 = "ten";
    }
}