contract AllSerializedKinds {
    ui4: Int as uint4;
    ii4: Int as int4;
    ui8: Int as uint8;
    ii8: Int as int8;
    ui16: Int as uint16;
    ii16: Int as int16;

    init() {
        self.ui4 = 5;
        self.ii4 = -3;
        self.ui8 = 200;
        self.ii8 = -100;
        self.ui16 = 65000;
        self.ii16 = -32000;
    }
}