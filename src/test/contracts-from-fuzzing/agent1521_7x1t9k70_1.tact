struct NestedInner {
    a: Int;
    b: String;
}

struct NestedOuter {
    x: NestedInner;
    y: Bool?;
    z: String;
}

contract FuzzTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: NestedInner{ a: 1, b: "hello" },
            y: null,
            z: "world"
        };
    }
}
