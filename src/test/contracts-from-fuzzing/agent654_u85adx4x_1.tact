struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: Bool;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 1,
            y: NestedInner{
                a: 2,
                b: true,
            },
            z: false,
        };
    }
}