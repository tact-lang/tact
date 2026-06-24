struct Inner {
    v: Int;
}

contract OptionalStructFieldTest {
    data: Inner?;
    init() {
        self.data = Inner{
            v: 101,
        };
    }
}
