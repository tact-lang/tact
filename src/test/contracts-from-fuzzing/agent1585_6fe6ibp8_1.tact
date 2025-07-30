struct Nested {
    innerVal: Int;
    flag: Bool;
}

contract DeepOptional {
    nestedField: Nested?;

    init() {
        self.nestedField = null;
    }
}