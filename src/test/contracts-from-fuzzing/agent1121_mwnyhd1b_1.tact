struct NestedStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            a: 42,
            b: true,
        };
    }
}