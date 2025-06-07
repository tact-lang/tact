struct NestedInner {
    s: String;
    i: Int as uint8;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract NestedStructs {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                s: "nested",
                i: 5,
            },
            flag: true,
        };
    }
}