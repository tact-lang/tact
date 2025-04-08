struct StringStruct {
    s1: String;
    s2: String;
}

contract StringFields {
    data: StringStruct;

    init() {
        self.data = StringStruct {
            s1: "hello",
            s2: "world"
        };
    }
}