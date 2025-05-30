struct InnerStruct {
    a: Int;
    b: Bool;
}

contract NestedStructContract {
    data: InnerStruct;
    
    init() {
        self.data = InnerStruct{ a: 1, b: true };
    }
}