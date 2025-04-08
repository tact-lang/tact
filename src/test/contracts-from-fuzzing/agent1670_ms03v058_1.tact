struct NestedInner {
    a: Int;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
}

contract TestStorage {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 1,
            y: NestedInner{a:2}
        };
    }
}
