struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalStructTest {
    data: Inner?;

    init() {
        self.data = null;
    }
}