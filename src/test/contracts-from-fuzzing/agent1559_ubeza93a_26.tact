struct Serialization {
    small: Int as uint8 = 5;
    middle: Int as uint64 = 12345;
    big: Int as uint256 = 12345678901234567890;
}

contract SerializeStruct {
    s: Serialization;

    init() {
        self.s = Serialization{};
    }
}