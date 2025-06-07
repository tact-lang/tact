struct StringStruct {
    text1: String;
    text2: String;
}

contract StringFields {
    s: StringStruct;

    init() {
        self.s = StringStruct{
            text1: "foo",
            text2: "bar"
        };
    }
}
