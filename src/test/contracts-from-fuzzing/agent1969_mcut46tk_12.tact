struct BitsNested {
    small: Int as uint4;
    mid: Int as uint8;
    large: Int as uint32;
}

contract SerializedFields {
    nested: BitsNested;

    init() {
        self.nested = BitsNested{small: 7, mid: 255, large: 123456};
    }
}