struct NestedInner {
    x: Int;
    y: Bool;
    optStr: String?;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
    num: Int as uint32;
}

contract NestedTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                x: 10,
                y: true,
                optStr: "hi",
            },
            flag: false,
            num: 123,
        };
    }
}