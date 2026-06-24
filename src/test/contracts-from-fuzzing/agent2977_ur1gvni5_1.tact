struct Nested {
    inner: Int;
}

contract DeepOptional {
    data: Nested?;

    init() {
        self.data = null;
    }
}