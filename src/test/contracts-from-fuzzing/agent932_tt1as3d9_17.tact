struct InnerAnno {
    small: Int as uint8;
    medium: Int as int64;
}

struct OuterAnno {
    x: Int;
    inner: InnerAnno;
}

contract StructWithSerialTags {
    data: OuterAnno;

    init() {
        self.data = OuterAnno{
            x: 1,
            inner: InnerAnno{
                small: 255,
                medium: 42,
            },
        };
    }
}