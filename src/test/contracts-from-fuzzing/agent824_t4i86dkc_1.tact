struct NestedStruct1 {
    a: Int;
    b: Bool?;
}

contract TestContract {
    ns: NestedStruct1;
    
    init() {
        self.ns = NestedStruct1{
            a: 1,
            b: true,
        };
    }
}