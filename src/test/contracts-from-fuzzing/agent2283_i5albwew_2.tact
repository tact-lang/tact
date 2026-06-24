struct NestedInner {
    a: Int;
    b: Bool;
    c: Int?;
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
                a: 10,
                b: true,
                c: null,
            },
            flag: false,
        };
    }
}
