struct NestedInner {
    u: Int;
    b: Bool;
    s: String;
}

struct NestedOuter {
    x: Int;
    ni: NestedInner;
}

contract TestNested {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 5,
            ni: NestedInner{
                u: 1,
                b: false,
                s: "nest"
            }
        };
    }
}