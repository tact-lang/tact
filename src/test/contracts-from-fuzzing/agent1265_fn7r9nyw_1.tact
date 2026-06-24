struct NestedInner {
    x: Int;
    y: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                x: 5,
                y: true,
            },
            flag: false,
        };
    }
}