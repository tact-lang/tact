struct InnerStruct {
    val1: Int;
    val2: Address?;
}

contract NestedOptionalFields {
    data: InnerStruct?;
    
    init() {
        self.data = null;
    }
}