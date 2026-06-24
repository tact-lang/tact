struct NestedSerialization {
    v1: Int as uint8;
    s1: String;
    inner: InnerS;
}

struct InnerS {
    v2: Int as int16;
    opt: Int? as uint32;
}

contract TestContract {
    data: NestedSerialization;

    init() {
        self.data = NestedSerialization{
            v1: 5,
            s1: "test",
            inner: InnerS{
                v2: -100,
                opt: 777,
            }
        };
    }
}
