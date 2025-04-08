struct IntSizes {
    u4: Int as uint4;
    s5: Int as int5;
    u17: Int as uint17;
    s35: Int as int35;
}

contract IntSizesContract {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            u4: 12,
            s5: -10,
            u17: 50000,
            s35: -10000000
        };
    }
}