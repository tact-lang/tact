struct ExtremeWidths {
    tinySigned: Int as int1;
    bigSigned: Int as int257;
    tinyUnsigned: Int as uint1;
    bigUnsigned: Int as uint256;
    midSigned: Int as int16;
    midUnsigned: Int as uint8;
    optVal: Int?;
}

contract ExtremeWidthsContract {
    val: ExtremeWidths;

    init() {
        self.val = ExtremeWidths{
            tinySigned: -1,
            bigSigned: 42,
            tinyUnsigned: 1,
            bigUnsigned: 123456,
            midSigned: -123,
            midUnsigned: 250,
            optVal: null,
        };
    }
}