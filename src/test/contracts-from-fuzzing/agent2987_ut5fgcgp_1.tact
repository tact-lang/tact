struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract NestedStructContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                a: 1,
                b: true,
            },
            flag: false,
        };
    }
}
