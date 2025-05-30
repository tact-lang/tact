struct ExoticWidths {
    b1: Int as int1;
    b4: Int as int4;
    b7: Int as int7;
    wide: Int as int256;
}

contract ExoticSerialize {
    data: ExoticWidths;

    init() {
        self.data = ExoticWidths{
            b1: 1,
            b4: 7,
            b7: 50,
            wide: 123456789012345678901234567890
        };
    }
}
