struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    x: NestedInner;
    y: Int;
}

contract TestContract {
    val: NestedOuter;

    init() {
        self.val = NestedOuter{
            x: NestedInner{ a: 5, b: true },
            y: 10
        };
    }
}