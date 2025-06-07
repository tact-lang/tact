struct Inner {
    x: Int = 1;
    y: Int?;
}

contract NestedStructTest {
    data: Inner;
    init() {
        self.data = Inner{ x: 10, y: 20 };
    }
}