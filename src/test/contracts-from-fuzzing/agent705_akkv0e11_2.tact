struct InnerLayer {
    val1: Int;
    val2: Bool;
}

contract NestedStructTest {
    point: InnerLayer;

    init() {
        self.point = InnerLayer{val1: 1, val2: true};
    }
}