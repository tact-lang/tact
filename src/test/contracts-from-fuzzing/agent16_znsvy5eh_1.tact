struct Nested {
    a: Int;
    b: Bool;
}

contract DeepOptionalTest {
    testField: Nested?;

    init() {
        self.testField = null;
    }
}