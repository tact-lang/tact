struct DeeplyNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    optInner: Int?;
}

struct UseNested {
    inner: DeeplyNested;
    other: Int;
    optStr: String?;
}

contract NestedStructOptionalTest {
    data: UseNested;

    init() {
        self.data = UseNested{
            inner: DeeplyNested{
                inner1: 10,
                inner2: false,
                inner3: "abc",
                optInner: null
            },
            other: 999,
            optStr: null
        };
    }
}