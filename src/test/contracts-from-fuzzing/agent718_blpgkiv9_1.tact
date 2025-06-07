struct Inner {
    number: Int;
}

contract DeepOptionalStructTest {
    data: Inner?;
    init() {
        self.data = null;
    }
}