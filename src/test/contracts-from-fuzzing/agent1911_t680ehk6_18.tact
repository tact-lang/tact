struct IntsDifferentWidths {
    big: Int;
    smallUnsigned: Int as uint8;
    mediumSigned: Int as int32;
}

contract IntWidths {
    info: IntsDifferentWidths;

    init() {
        self.info = IntsDifferentWidths{
            big: 1000000,
            smallUnsigned: 255,
            mediumSigned: -12345
        };
    }
}