struct Nested {
    id: Int;
    name: String;
}

contract OptionalEntireStruct {
    nested: Nested?;

    init() {
        self.nested = null;
    }
}