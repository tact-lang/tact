struct MixedCompressed {
    u8: Int as uint8;
    u16: Int as uint16;
    i8: Int as int8;
    i16: Int as int16;
    defaultInt: Int;
}

contract StorageMixedCompressed {
    vals: MixedCompressed;

    init() {
        self.vals = MixedCompressed{
            u8:1, u16:2, i8:3, i16:4, defaultInt:5
        };
    }
}