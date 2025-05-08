struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    data: InnerStruct;
    
    init() {
        self.data = InnerStruct{a: 1, b: true, c: "hi"};
    }
}