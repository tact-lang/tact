struct NestedInner {
    z: Bool;
    t: Int;
}

struct Outer {
    inner: NestedInner;
    msg: String;
}

contract Test3 {
    data: Outer;

    init() {
        self.data = Outer{
            inner: NestedInner{ z: false, t: 123 },
            msg: "deep"
        };
    }
}