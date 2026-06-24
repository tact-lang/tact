struct NestedSerialization {
    a: Int as int32;
    b: Inner;
}

struct Inner {
    c: Int as uint8;
    d: Int as int64;
}

contract SerializeTest {
    val: NestedSerialization;
    init() {
        self.val = NestedSerialization{
            a: -12345,
            b: Inner{
                c: 255,
                d: -999999
            }
        };
    }
}