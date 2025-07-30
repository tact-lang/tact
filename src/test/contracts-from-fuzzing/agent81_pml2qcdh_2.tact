struct Nested {
    innerBool: Bool;
    innerInt: Int;
    innerStr: String;
}

contract Test {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            innerBool: true,
            innerInt: 42,
            innerStr: "hello"
        };
    }
}
