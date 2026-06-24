struct NestedInner {
    x: Int;
    y: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract DeepNestedFields {
    point: NestedOuter;

    init() {
        self.point = NestedOuter{
            inner: NestedInner{
                x: 10,
                y: true,
            },
            flag: false,
        };
    }
}