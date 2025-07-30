struct NestedComplexOptional {
    str: String;
    optInt: Int?;
    optBool: Bool?;
}

contract NestedComplexOptionalTest {
    data: NestedComplexOptional?;

    init() {
        self.data = null;
    }
}