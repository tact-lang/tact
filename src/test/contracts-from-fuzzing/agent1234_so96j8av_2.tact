struct Inner {
    x: Int;
    y: Bool;
}

contract NestedStructTest {
    point: Inner;

    init() {
        self.point = Inner{
            x: 7,
            y: true,
        };
    }
}