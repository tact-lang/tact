struct NestedStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            x: 42,
            y: true,
        };
    }
}