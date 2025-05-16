struct OptionalInner {
    innerInt: Int?;
    innerBool: Bool?;
}

contract OptionalFieldsTest {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            innerInt: null,
            innerBool: true
        };
    }
}
