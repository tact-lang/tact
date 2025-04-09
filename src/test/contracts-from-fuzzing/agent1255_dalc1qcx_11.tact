struct IntSizes {
    si: Int as int64;
    ui: Int as uint64;
    bigi: Int;
    bit: Int as uint1;
}

contract IntSizesTest {
    f: IntSizes;
    init() {
        self.f = IntSizes{
            si: -100,
            ui: 100,
            bigi: 1000000000000,
            bit:1
        };
    }
}