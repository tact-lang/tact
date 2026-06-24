struct DeepInner {
    foo: Int as uint32;
    bar: Int as int64;
}

struct Mid {
    di: DeepInner;
    val: Int as uint8;
}

struct Top {
    mid: Mid;
    other: Int as int257;
}

contract SerializedDeep {
    d: Top;

    init() {
        self.d = Top{
            mid: Mid{
                di: DeepInner{
                    foo: 123,
                    bar: -123
                },
                val: 42,
            },
            other: 900
        };
    }
}