struct NestedStruct {
    a: Int;
    b: String;
    c: Bool;
}

contract ComplexStorage {
    simpleInt: Int;
    simpleBool: Bool;
    simpleString: String;
    nested: NestedStruct;
    optionalNested: NestedStruct?;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;

    init() {
        self.simpleInt = 42;
        self.simpleBool = true;
        self.simpleString = "hello";
        self.nested = NestedStruct{a: 1, b: "hi", c: false};
        self.optionalNested = null;
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalString = null;
    }
}