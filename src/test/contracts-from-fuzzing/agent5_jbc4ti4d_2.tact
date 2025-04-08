struct NestedInner {
    foo: Int;
    bar: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    msg: String;
}

contract ComplexNested {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                foo: 1,
                bar: true,
            },
            msg: "test"
        };
    }
}