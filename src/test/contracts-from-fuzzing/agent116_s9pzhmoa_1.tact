struct NestedInner {
    a: Int;
    b: Int?;
    c: Bool;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: Int?;
}

contract TestNested {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 1,
            y: NestedInner{
                a: 2,
                b: null,
                c: true,
            },
            z: null,
        };
    }
}