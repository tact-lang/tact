struct TinyInts {
    sbit: Int as int1;
    ubit: Int as uint1;
}

contract MinIntBits {
    data: TinyInts;
    init() {
        self.data = TinyInts{sbit:0, ubit:1};
    }
}