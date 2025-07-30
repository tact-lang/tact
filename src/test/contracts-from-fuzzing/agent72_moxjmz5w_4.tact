struct NestedMost {
    x: Int;
    y: Bool;
}

struct NestedMid {
    a: NestedMost;
    b: String;
}

struct NestedOuter {
    first: NestedMid;
    second: Int;
}

contract DeepLayers {
    store: NestedOuter;

    init() {
        self.store = NestedOuter{
            first: NestedMid{
                a: NestedMost{ x: 7, y: true },
                b: "hello"
            },
            second: 42
        };
    }
}