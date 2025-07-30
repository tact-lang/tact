struct OptionalNested {
    nested: Nested?;
}

struct Nested {
    value: Int;
    text: String;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ nested: null };
    }
}
