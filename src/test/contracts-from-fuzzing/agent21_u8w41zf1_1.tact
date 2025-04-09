struct Nested {
    innerInt: Int;
    innerBool: Bool;
}

contract TestContract {
    simpleInt: Int;
    nestedStruct: Nested;
    optNested: Nested?;

    init() {
        self.simpleInt = 1;
        self.nestedStruct = Nested{innerInt: 42, innerBool: true};
        self.optNested = null;
    }

    receive() {}
}