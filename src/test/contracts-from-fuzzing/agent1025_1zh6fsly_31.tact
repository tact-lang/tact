contract MixedSerialization {
    ui8: Int as uint8;
    sint64: Int as int64;
    defaultInt: Int;

    init() {
        self.ui8 = 255;
        self.sint64 = -500;
        self.defaultInt = 999;
    }
}
