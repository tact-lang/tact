struct StringFields {
    s1: String;
    s2: String?;
}

contract StringStructStorage {
    s: StringFields;

    init() {
        self.s = StringFields{
            s1: "abc",
            s2: null
        };
    }
}
