struct SerializeNested {
    small: Int as uint8;
    big: Int as int257;
    inner: InnerSerialize;
}

struct InnerSerialize {
    mid: Int as uint32;
    tiny: Int as int16;
}

contract NestedSerializeTest {
    data: SerializeNested;

    init() {
        self.data = SerializeNested{
            small: 3,
            big:10000,
            inner: InnerSerialize{
                mid: 500,
                tiny: -123,
            },
        };
    }
}