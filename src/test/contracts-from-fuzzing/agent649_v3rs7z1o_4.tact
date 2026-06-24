struct OptionalInner {
    value: Int?;
    note: String?;
}

contract OptionalStructTest {
    optionalNested: OptionalInner;

    init() {
        self.optionalNested = OptionalInner{
            value: null,
            note: null
        };
    }
}