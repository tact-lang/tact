struct Nested {
    level1: Int;
    level2: Int?;
}

contract DeepOptionalNested {
    data: Nested?;

    init() {
        self.data = null;
    }
}