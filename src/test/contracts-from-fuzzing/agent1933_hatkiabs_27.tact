struct Inner {
    a: Int;
    b: Bool?;
}

contract NullStructFieldTest {
    data: Inner?;
    init() {
        self.data = null;
    }
}