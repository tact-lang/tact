struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    ni: NestedInner;
    x: Int;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            ni: NestedInner{
                a: 1,
                b: true,
            },
            x: 2,
        };
    }
}