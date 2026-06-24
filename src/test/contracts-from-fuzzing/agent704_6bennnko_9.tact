struct FixedSize {
    tiny: Int as uint3;
    small: Int as uint8;
    mid: Int as int16;
    big: Int as int257;
}

contract FixedSizeFields {
    data: FixedSize;

    init() {
        self.data = FixedSize{
            tiny: 7,
            small: 255,
            mid: 12345,
            big: 123456789012345678901234567890
        };
    }
}