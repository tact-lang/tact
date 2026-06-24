struct Nested {
    field1: Int;
    optField: Bool?;
    strField: String;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            field1: 10,
            optField: null,
            strField: "hello"
        };
    }
}