struct IntVariants {
    big: Int;
    byte: Int as uint8;
    small: Int as int16;
}

contract MultiSizeInts {
    data: IntVariants;

    init() {
        self.data = IntVariants{
            big: 1000000,
            byte: 255,
            small: -12345,
        };
    }
}
