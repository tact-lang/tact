// Serialize small integers within a struct

struct MixedSizes {
    u4: Int as uint4;
    u10: Int as uint10;
    i8: Int as int8;
    u16: Int as uint16;
}

contract TestContract {
    val: MixedSizes;

    init() {
        self.val = MixedSizes {
            u4: 7,
            u10: 512,
            i8: -32,
            u16: 65535
        };
    }
}