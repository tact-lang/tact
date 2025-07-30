struct NestedSerialize {
    small: Int as uint8;
    big: Int;
}

contract SerializeInsideStruct {
    s: NestedSerialize;

    init() {
        self.s = NestedSerialize{
            small: 255,
            big: 123456789,
        };
    }
}
