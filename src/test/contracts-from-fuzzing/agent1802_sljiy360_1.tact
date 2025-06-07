struct InnerStruct1 { val1: Int; }

contract TestContract {
    nested: InnerStruct1;
    
    init() {
        self.nested = InnerStruct1{val1: 42};
    }
}