struct InnerStruct {
    intField: Int = 1;
    boolField: Bool = true;
    optInt: Int?;
}

contract DeepNestedContract {
    nested: InnerStruct;
    
    init() {
        self.nested = InnerStruct{};
    }
}