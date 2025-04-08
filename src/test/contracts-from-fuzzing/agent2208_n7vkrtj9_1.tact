struct Nested {
    innerVal: Int?;
}

contract DeepOptionalTest {
    nestedStruct: Nested?;

    init() {
        self.nestedStruct = null;
    }
}