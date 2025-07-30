struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract StorageDeeplyNested {
    nested: InnerStruct;
    
    init() {
        self.nested = InnerStruct{
            val1: 123,
            val2: true,
        };
    }
}