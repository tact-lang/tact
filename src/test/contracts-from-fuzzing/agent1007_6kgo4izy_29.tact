struct Serialization {
    small: Int as uint8;
    med: Int as uint64;
    large: Int as int257;
}

contract SerStructField {
    val: Serialization;

    init() {
        self.val = Serialization{
            small: 128,
            med: 10000000,
            large: -1234567890,
        };
    }
}