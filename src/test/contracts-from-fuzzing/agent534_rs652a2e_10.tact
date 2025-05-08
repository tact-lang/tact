struct FixedSize {
    small: Int as uint8;
    large: Int as int257;
}

contract FixedSizeContract {
    numbers: FixedSize;

    init() {
        self.numbers = FixedSize{
            small: 12,
            large: 12345678901234567890,
        };
    }
}