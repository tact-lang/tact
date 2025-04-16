struct NestedOptionals {
    x: Int?;
    y: Int?;
    s: String?;
}

contract NestedOptionalsTest {
    data: NestedOptionals?;

    init() {
        self.data = null;
    }
}