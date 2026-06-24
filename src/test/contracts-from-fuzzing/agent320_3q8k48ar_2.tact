struct Inner {
    x: Int;
    y: Bool;
}

contract NestedOptTest {
    data: Inner?;
    init() {
        self.data = Inner{ x: 42, y: true };
    }
}