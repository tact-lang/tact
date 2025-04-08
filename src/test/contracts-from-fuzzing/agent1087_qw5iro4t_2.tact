struct NestedStruct {
    ni: Int;
    bs: Bool;
    addr: Address;
}

contract TestContract {
    nested: NestedStruct;
    
    init() {
        self.nested = NestedStruct{
            ni: 42,
            bs: true,
            addr: myAddress(),
        };
    }
    
    receive() {}
}