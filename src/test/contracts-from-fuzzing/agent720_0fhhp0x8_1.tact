struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: String?;
}

contract DeepNestingOptional {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 42,
            y: NestedInner{
                a: 1,
                b: null,
            },
            z: null,
        };
    }
}