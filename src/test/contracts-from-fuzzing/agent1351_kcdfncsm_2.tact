struct Inner {
    val: Int;
    optionalFlag: Bool?;
}

struct MidLevel {
    inner: Inner;
    text: String;
    optInner: Inner?;
}

contract VariedNest {
    record: MidLevel;

    init() {
        self.record = MidLevel{
            inner: Inner{ val: 42, optionalFlag: null },
            text: "hello",
            optInner: null
        };
    }
}