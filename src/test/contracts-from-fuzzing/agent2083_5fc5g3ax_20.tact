struct StringStruct {
    s1: String;
    s2: String;
}

contract NestedStrings {
    st: StringStruct;

    init() {
        self.st = StringStruct{
            s1: "first",
            s2: "second",
        };
    }
}
