struct StringStruct {
    s1: String;
    s2: String;
}

contract StringFields {
    field: StringStruct;
    
    init() {
        self.field = StringStruct{ s1: "hello", s2: "world" };
    }
}