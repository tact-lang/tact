struct NestedStr {
    str: String;
    optInt: Int?;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    nested: NestedStr; 
    optionalNested: NestedStr?;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.nested = NestedStr{ str: "test", optInt: null };
        self.optionalNested = null;
    }
}