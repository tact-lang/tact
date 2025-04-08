struct Nested {
    value: Int;
}

contract DeepOptional {
    data: Nested?;

    init() {
        self.data = null;
    }
}