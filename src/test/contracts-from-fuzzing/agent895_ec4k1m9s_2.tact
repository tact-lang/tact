struct NestedInner {
    n: Int;
    o: Bool;
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
                n: 42,
                o: false,
            },
            flag: true,
        };
    }
}