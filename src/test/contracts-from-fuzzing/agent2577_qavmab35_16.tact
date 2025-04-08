struct Ints {
    ui8: Int as uint8;
    ui16: Int as uint16;
    si32: Int as int32;
    si64: Int as int64;
    ui128: Int as uint128;
    si257: Int as int257;
}

contract IntegersTest {
    data: Ints;

    init() {
        self.data = Ints{
            ui8: 255,
            ui16: 65535,
            si32: -1000,
            si64: 100000,
            ui128: 999999999,
            si257: -5000000,
        };
    }
}
