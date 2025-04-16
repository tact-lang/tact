struct NestedStruct {
    nestedInt: Int;
    nestedBool: Bool;
}

contract TestContract {
    simpleInt: Int;
    simpleBool: Bool;
    simpleString: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    nested: NestedStruct;

    init() {
        self.simpleInt = 1;
        self.simpleBool = true;
        self.simpleString = "hello";
        self.optionalInt = null;
        self.optionalBool = false;
        self.nested = NestedStruct{
            nestedInt: 42,
            nestedBool: false,
        };
    }

    receive() {}
}