struct IntSizes {
    u4: Int as uint4;
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;
    i128: Int as int128;
    u256: Int as uint256;
    normal: Int;
}

contract IntSizesTest {
    data: IntSizes;
    init() {
        self.data = IntSizes{
            u4:1,i8:2,u16:3,i32:4,u64:5,i128:6,u256:7,normal:8
        };
    }
}
