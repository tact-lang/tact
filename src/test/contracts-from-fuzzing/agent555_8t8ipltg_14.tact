struct StringStruct {
    text1: String;
    text2: String;
}

contract StringFields {
    foo: StringStruct;

    init() {
        self.foo = StringStruct{
            text1: "Hello",
            text2: "World!"
        };
    }
}