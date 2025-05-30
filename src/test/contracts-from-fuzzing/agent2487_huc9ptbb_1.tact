struct SimpleStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    simple: SimpleStruct;
    
    init() {
        self.simple = SimpleStruct{
            a: 42,
            b: true,
            c: "hello world"
        };
    }
}