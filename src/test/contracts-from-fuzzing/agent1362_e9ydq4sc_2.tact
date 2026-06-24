struct Nested {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
}

contract Test {
    nested: Nested;

    init() {
        self.nested = Nested{
            intField: 1,
            boolField: false,
            addrField: myAddress(),
            strField: "hello",
            optInt: null,
            optBool: true,
            optAddr: null
        };
    }

    receive() {}
}