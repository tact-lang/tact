struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: Bool?;
}

contract TestStorage {
    val: NestedOuter;

    init() {
        self.val = NestedOuter{
            x: 5,
            y: NestedInner{ a: 1, b: true },
            z: null,
        };
    }
}