struct Param {
    small: Int as uint4;
    normal: Int;
}

struct TopLevel {
    param: Param;
    more: Int as int32;
}

contract CompositeBits {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            param: Param{ small: 8, normal: 12345 },
            more: -1000
        };
    }
}
