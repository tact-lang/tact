contract ManySimpleFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int as uint8;
    f5: Int as int16;
    f6: Address;
    f7: String?;
    f8: Bool?;
    f9: Int?;
    f10: Int as coins;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "abc";
        self.f4 = 255;
        self.f5 = -100;
        self.f6 = myAddress();
        self.f7 = null;
        self.f8 = false;
        self.f9 = 9;
        self.f10 = 1_000_000_000;
    }
}