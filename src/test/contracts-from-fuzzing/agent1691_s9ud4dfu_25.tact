struct NestedSerialization {
    inner: InnerSerialize;
}

struct InnerSerialize {
    x: Int as int32;
    y: Int as uint8;
}

contract NestedSerializationTest {
    s: NestedSerialization;

    init() {
        self.s = NestedSerialization{
            inner: InnerSerialize{
                x:12,
                y:34
            }
        };
    }
}