struct StringStruct {
    s1: String;
    s2: String;
}

contract StringsInStruct {
    data: StringStruct;

    init() {
        self.data = StringStruct{ s1: "foo", s2: "bar" };
    }
}