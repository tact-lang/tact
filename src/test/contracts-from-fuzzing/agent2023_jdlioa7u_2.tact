struct Nested {
    innerInt: Int;
    innerBool: Bool;
    optStr: String?;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            innerInt: 1,
            innerBool: true,
            optStr: null,
        };
    }

    receive() {
        let x = self.nestedField.innerInt;
    }
}