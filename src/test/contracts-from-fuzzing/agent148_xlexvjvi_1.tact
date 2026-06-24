struct NestedStruct {
    inner1: Int;
    inner2: Bool;
}

contract TestContract {
    simpleInt: Int;
    simpleBool: Bool;
    nested: NestedStruct;
    optionalNested: NestedStruct?;
    optionalInt: Int?;

    init() {
        self.simpleInt = 5;
        self.simpleBool = true;
        self.nested = NestedStruct{ inner1: 1, inner2: false };
        self.optionalNested = null;
        self.optionalInt = null;
    }
}