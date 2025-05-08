struct OptionalInner {
    a: Int?;
    b: Bool?;
}

contract OptStructTest {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{ a: null, b: true };
    }
}