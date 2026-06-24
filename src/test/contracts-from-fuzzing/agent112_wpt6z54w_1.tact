struct InnerStruct {
    intField: Int;
    boolField: Bool;
    stringField: String;
}

contract TestContract {
    nested: InnerStruct;
    
    init() {
        self.nested = InnerStruct{
            intField: 1,
            boolField: true,
            stringField: "test"
        };
    }
}