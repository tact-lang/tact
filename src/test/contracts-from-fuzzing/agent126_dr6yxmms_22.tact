struct NestedSerial {
    small: Int as uint8;
    big: Int as int64;
}

contract NestedSerialization {
    nested: NestedSerial;

    init() {
        self.nested = NestedSerial{
            small: 255,
            big: -5000000000
        };
    }
}