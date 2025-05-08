struct StringStruct {
    s1: String;
    s2: String;
}

contract TestStrings {
    content: StringStruct;

    init() {
        self.content = StringStruct{
            s1: "abc",
            s2: "def",
        };
    }
}
