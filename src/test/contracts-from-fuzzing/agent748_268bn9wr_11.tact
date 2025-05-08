struct IntExtremes {
    a: Int as int1;
    b: Int as int257;
    c: Int as uint1;
    d: Int as uint256;
    e: Int as uint4;
}

contract ExtremalIntSizes {
    extremes: IntExtremes;

    init() {
        self.extremes = IntExtremes{
            a: -1,
            b: 0,
            c: 1,
            d: 0,
            e: 15,
        };
    }
}
