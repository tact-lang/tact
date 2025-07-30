struct Inner {
    flag: Bool;
    text: String?;
}

struct Outer {
    num: Int;
    inner: Inner;
    optInner: Inner?;
}

contract VariedTypes {
    record: Outer;

    init() {
        self.record = Outer{
            num: 12,
            inner: Inner{ flag: true, text: null },
            optInner: null,
        };
    }
}