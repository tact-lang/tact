struct StringsInStruct {
    a: String;
    b: String;
    c: String;
}

contract MultiStringFields {
    s: StringsInStruct;

    init() {
        self.s = StringsInStruct{
            a:"x", b:"y", c:"z"
        };
    }
}