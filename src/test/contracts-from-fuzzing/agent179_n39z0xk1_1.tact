struct NestedStruct {
    a: Int;
    b: String;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{ a: 1, b: "test" };
    }
}