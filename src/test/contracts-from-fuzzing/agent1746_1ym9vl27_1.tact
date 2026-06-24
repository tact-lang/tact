struct NestedInner {
    x: Int;
    y: Bool;
}

struct NestedOuter {
    point: NestedInner;
    flag: Bool?;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            point: NestedInner{ x: 5, y: true },
            flag: null
        };
    }
}