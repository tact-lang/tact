struct Inner {
    x: Int;
    y: Int;
}

contract NestedStructTest {
    coords: Inner;

    init() {
        self.coords = Inner{ x: 10, y: 20 };
    }
}