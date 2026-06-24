// Optional of nested struct with embedded optional
struct Nested {
    prop: Int?;
    label: String;
}

contract DeepNestedOptional {
    stuff: Nested?;

    init() {
        self.stuff = null;
    }
}
