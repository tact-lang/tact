contract LongFlatFields {
    f1: Int;
    f2: Int as int8;
    f3: Int as int16;
    f4: Int as int32;
    f5: Bool;
    f6: Bool;
    f7: Int?;
    f8: Int?;
    f9: Bool?;
    f10: Bool?;
    
    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = true;
        self.f6 = false;
        self.f7 = null;
        self.f8 = 8;
        self.f9 = null;
        self.f10 = true;
    }
}