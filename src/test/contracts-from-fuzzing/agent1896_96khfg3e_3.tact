struct OptionalInner {
    a: Int;
    b: String?;
    c: Bool?;
}

contract OptionalTest {
    value: OptionalInner;

    init() {
        self.value = OptionalInner{
            a: 10,
            b: null,
            c: true
        };
    }
}