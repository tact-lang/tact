struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    label: String;
}

contract NestedStructs {
    info: NestedOuter;

    init() {
        self.info = NestedOuter{
            inner: NestedInner{
                a: 1,
                b: true,
            },
            label: "test",
        };
    }
}
