struct InnerStruct {
    foo: Int;
    bar: String;
}

contract TestContract {
    data: InnerStruct;
    
    init() {
        self.data = InnerStruct{foo: 42, bar: "hello"};
    }
}