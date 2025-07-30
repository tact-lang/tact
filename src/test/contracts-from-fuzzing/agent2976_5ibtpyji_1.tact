struct NestedInner {
    x: Int;
    y: Bool?;
}

struct NestedOuter {
    coord: NestedInner;
    label: String?;
}

contract TestDeepOptional {
    point: NestedOuter;

    init() {
        self.point = NestedOuter{
            coord: NestedInner{ x: 123, y: true },
            label: null
        };
    }
}