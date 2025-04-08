// Nested struct with serialized int fields of different bit widths
struct DeepSerialized {
    a: Int as uint4;
    b: Int as uint8;
    c: Inner;
}

struct Inner {
    x: Int as uint1;
    y: Int as uint256;
}

contract StorageTest {
    d: DeepSerialized;

    init() {
        self.d = DeepSerialized{
            a: 9,
            b: 255,
            c: Inner{ x: 1, y: 12345678901234567890 }
        };
    }
}