contract LongFields {
    fld1: Int;
    fld2: Bool;
    fld3: String;
    fld4: Int?;
    fld5: Bool?;
    fld6: String?;
    fld7: Int as uint32;
    fld8: Bool;
    fld9: String;
    fld10: Int;
    fld11: Bool;
    fld12: String;
    fld13: Int;
    fld14: Bool;
    fld15: String;
    fld16: Int?;
    fld17: String?;
    fld18: Bool?;
    fld19: Int as uint8;
    fld20: Int;

    init() {
        self.fld1 = 1;
        self.fld2 = false;
        self.fld3 = "a";
        self.fld4 = null;
        self.fld5 = null;
        self.fld6 = null;
        self.fld7 = 7;
        self.fld8 = true;
        self.fld9 = "b";
        self.fld10 = 10;
        self.fld11 = false;
        self.fld12 = "c";
        self.fld13 = 13;
        self.fld14 = true;
        self.fld15 = "d";
        self.fld16 = null;
        self.fld17 = null;
        self.fld18 = true;
        self.fld19 = 19;
        self.fld20 = 20;
    }
}