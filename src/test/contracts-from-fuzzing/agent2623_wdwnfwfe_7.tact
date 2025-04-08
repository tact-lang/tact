struct StringStruct {
    s: String;
    t: String;
}

contract TestContract {
    data: StringStruct;
    
    init() {
        self.data = StringStruct{
            s: "hello",
            t: "world",
        };
    }
}