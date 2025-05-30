struct StringFields {
    s1: String;
    s2: String?;
}

contract StrPersist {
    data: StringFields;
    init() {
        self.data = StringFields{
            s1: "abc",
            s2: null,
        };
    }
}