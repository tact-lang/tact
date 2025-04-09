struct Nested {
    foo: Int;
    bar: String;
}

contract OptionalNested {
    data: Nested?;

    init() {
        self.data = null;
    }
}