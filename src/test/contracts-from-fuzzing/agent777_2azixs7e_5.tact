struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract OptTest {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            foo: null,
            bar: true
        };
    }
}