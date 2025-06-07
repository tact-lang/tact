struct IntVariants {
    tiny: Int as uint4;
    small: Int as uint8;
    med: Int as uint16;
    big: Int as uint64;
    huge: Int;
}

contract SerializeVariants {
    data: IntVariants;

    init() {
        self.data = IntVariants{
            tiny: 2,
            small: 3,
            med: 300,
            big: 100000,
            huge: 10000000000
        };
    }
}
