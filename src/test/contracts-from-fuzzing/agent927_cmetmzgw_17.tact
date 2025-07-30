struct NestedWithSerialization {
    s1: Int as uint8;
    inner: InnerSer;
}

struct InnerSer {
    s2: Int as int16;
    s3: Bool;
}

contract ContractWithSer {
    d: NestedWithSerialization;

    init() {
        self.d = NestedWithSerialization{
            s1: 255,
            inner: InnerSer{
                s2: -1000,
                s3: true
            }
        };
    }
}