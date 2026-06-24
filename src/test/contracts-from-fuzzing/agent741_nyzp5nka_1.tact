struct Nested {
    innerInt: Int;
    innerBool: Bool;
    optInnerString: String?;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            innerInt: 10,
            innerBool: true,
            optInnerString: "hello",
        };
    }
}