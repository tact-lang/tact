struct IntSizes {
    defaultInt: Int;
    int64: Int as int64;
    int128: Int as int128;
    uint4: Int as uint4;
    uint32: Int as uint32;
}

contract IntSizeTest {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            defaultInt: -1,
            int64: -64,
            int128: -128,
            uint4: 4,
            uint32: 32
        };
    }
}