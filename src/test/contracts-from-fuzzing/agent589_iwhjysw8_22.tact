// large nested struct with mix of serialization options
struct SerializedMix {
    u4: Int as uint4;
    i64: Int as int64;
    u32: Int as uint32;
    standard: Int;
    flag: Bool;
    optStr: String?;
}

struct OuterSerial {
    sm1: SerializedMix;
    sm2: SerializedMix;
}

contract SerialNested {
    val: OuterSerial;

    init() {
        self.val = OuterSerial{
            sm1: SerializedMix{
                u4: 5,
                i64: -1000,
                u32: 123456,
                standard: 42,
                flag: true,
                optStr: null
            },
            sm2: SerializedMix{
                u4: 7,
                i64: 1000,
                u32: 654321,
                standard: 84,
                flag: false,
                optStr: null
            }
        };
    }
}