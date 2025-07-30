struct FormatMix {
    smallU: Int as uint8;
    bigU: Int as uint128;
    optional4: Int? as uint4;
    optional64: Int? as uint64;
    signed51: Int as int51;
}

contract MixedFormats {
    data: FormatMix;

    init() {
        self.data = FormatMix{
            smallU: 200,
            bigU: pow(2, 64) + 1000,
            optional4: 7,
            optional64: null,
            signed51: -123456
        };
    }
}