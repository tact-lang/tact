struct OptionalNested {
    foo: Int?;
    bar: String?;
}

contract NestedOptional {
    data: OptionalNested?;

    init() {
        self.data = null;
    }
}