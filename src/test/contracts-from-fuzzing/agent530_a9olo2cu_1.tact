struct NestedInner {
    a: Int;
    b: Bool;
    c: String;
}

struct NestedOuter {
    x: Int;
    y: Bool;
    z: NestedInner;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 1,
            y: true,
            z: NestedInner{
                a: 42,
                b: false,
                c: "test"
            }
        };
    }
}
