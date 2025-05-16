struct SOuter {
    inner: SInner;
    tag: Int;
}

struct SInner {
    flag: Bool;
    comment: String;
}

contract NestedMiddle {
    data: SOuter;

    init() {
        self.data = SOuter{
            inner: SInner{
                flag: true,
                comment: "nested",
            },
            tag: 42,
        };
    }
}