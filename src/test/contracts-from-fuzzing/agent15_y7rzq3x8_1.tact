struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: InnerStruct;
    
    init() {
        self.data = InnerStruct{
            a: 42,
            b: true,
            c: "hello",
        };
    }
}