struct Inner {
    nested: Int?;
    flag: Bool?;
}

contract OptionalStructTest {
    data: Inner;

    init() {
        self.data = Inner{ nested: null, flag: true };
    }
}