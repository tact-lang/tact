struct Compact {
    tiny: Int as uint1;
    small: Int as uint4;
    mid: Int as uint8;
    big: Int as uint32;
}

contract CompactState {
    data: Compact;

    init() {
        self.data = Compact{
            tiny: 1,
            small: 5,
            mid: 127,
            big: 100000
        };
    }
}