struct NestedInner {
    x: Int;
    y: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    z: String;
}

contract NestedFields {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                x: 10,
                y: true,
            },
            z: "hi",
        };
    }
}