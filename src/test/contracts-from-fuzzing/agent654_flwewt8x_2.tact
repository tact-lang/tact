struct Nested {
    deepInt: Int;
    deepBool: Bool;
    deepString: String;
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    nested: Nested;
    init() {
        self.nested = Nested{
            deepInt: 42,
            deepBool: true,
            deepString: "hello",
            optInt: null,
            optBool: false
        };
    }
}