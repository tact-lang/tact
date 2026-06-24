struct Inner {
    a: Int = 10;
    b: Bool = false;
    c: Int?;
}

contract NestedStructTest {
    point: Inner;

    init() {
        self.point = Inner{};
    }
}
