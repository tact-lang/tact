struct NestedInner {
    z: Int = 3;
}

struct NestedOuter {
    x: Int = 1;
    y: NestedInner;
}

contract DeepNestedContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{ x: 10, y: NestedInner{ z: 20 } };
    }
}