struct InnerMost {
    v: Int as int32;
    flag: Bool;
}

struct Inner {
    nested: InnerMost;
    text: String;
}

struct Outer {
    a: Int as uint8;
    b: Bool;
    inner: Inner;
}

contract DeepSerialization {
    data: Outer;

    init() {
        self.data = Outer{
            a: 255,
            b: true,
            inner: Inner{
                nested: InnerMost{
                    v: -2147483648,
                    flag: false
                },
                text: "ok"
            }
        };
    }
}
