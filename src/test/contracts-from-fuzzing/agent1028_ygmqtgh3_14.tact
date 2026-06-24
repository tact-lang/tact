struct InnerOpt {
    foo: Int;
}

contract OptionalStructTest {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}