struct Data {
    innerFlag: Bool;
}

contract OptionalFieldTest {
    optionalData: Data?;

    init() {
        self.optionalData = null;
    }
}