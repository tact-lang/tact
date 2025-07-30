struct Nested {
    a: Int;
    b: Int?;
}

contract DeepOptionalTest {
    nested: Nested?;

    init() {
        self.nested = null;
    }
}