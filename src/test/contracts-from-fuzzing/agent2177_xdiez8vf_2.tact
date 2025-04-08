struct NestedInner {
    a: Int;
    b: Bool;
    c: String;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: Bool;
}

contract TestNested {
    s: NestedOuter;

    init() {
        self.s = NestedOuter{
            x: 1,
            y: NestedInner{
                a: 2,
                b: false,
                c: "nested"
            },
            z: true
        };
    }
}