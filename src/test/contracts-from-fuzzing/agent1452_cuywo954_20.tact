struct ManyIntSizes {
    ui4: Int as uint4;
    ui8: Int as uint8;
    ui16: Int as uint16;
    ui32: Int as uint32;
    si4: Int as int4;
    si8: Int as int8;
    si16: Int as int16;
    si32: Int as int32;
}

contract IntSerializationTest {
    ints: ManyIntSizes;

    init() {
        self.ints = ManyIntSizes{
            ui4: 3,
            ui8: 5,
            ui16: 7,
            ui32: 9,
            si4: -1,
            si8: -5,
            si16: -7,
            si32: -9,
        };
    }
}
