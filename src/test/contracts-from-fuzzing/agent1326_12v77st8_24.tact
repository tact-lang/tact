struct Inner {
    a: Int;
}

contract OptionalStructFieldTest {
    data: Inner?;
    init() {
        self.data = null;
    }
}