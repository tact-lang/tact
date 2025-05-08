struct SerialFormats {
    one: Int as int8;
    two: Int as uint64;
    three: Int as uint128;
    four: Int as int256;
}

contract SerialFormatsTest {
    sf: SerialFormats;

    init() {
        self.sf = SerialFormats {
            one: -5,
            two: 123,
            three: 456789,
            four: -999999
        };
    }
}