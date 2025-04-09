struct NestedStruct {
    a: Int;
    b: Int?;
    c: String;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            a: 1,
            b: null,
            c: "hello",
        };
    }
}