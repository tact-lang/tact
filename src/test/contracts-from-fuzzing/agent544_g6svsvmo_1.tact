struct SimpleNested {
    inner1: Int;
    inner2: Bool;
}

contract TestContract {
    nestedStruct: SimpleNested;
    
    init() {
        self.nestedStruct = SimpleNested{
            inner1: 5,
            inner2: true
        };
    }
}