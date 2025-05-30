struct NestedInner {
    x: Int;
    y: Int;
}

contract NestedStructField {
    pos: NestedInner;

    init() {
        self.pos = NestedInner{ x: 10, y: 20 };
    }
}