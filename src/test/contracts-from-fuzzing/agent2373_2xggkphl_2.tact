struct NestedPoint {
    x: Int;
    y: Int;
}

contract DeepNested {
    pos: NestedPoint;

    init() {
        self.pos = NestedPoint{x: 1, y: 2};
    }
}