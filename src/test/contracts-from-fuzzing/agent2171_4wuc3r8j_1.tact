struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: String?;
}

contract DeeplyNestedTest {
    nested: NestedOuter;

    init() {
        self.nested = NestedOuter{
            x: 1,
            y: NestedInner{
                a: 2,
                b: true,
            },
            z: "test",
        };
    }
}