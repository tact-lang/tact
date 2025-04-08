struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructTest {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{ foo: null, bar: true };
    }
}