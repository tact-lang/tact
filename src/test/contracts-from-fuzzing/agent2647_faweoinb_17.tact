struct StringsNesting {
    s1: String;
    s2: String?;
    i: Int;
}

contract StorageWithStrings {
    a: StringsNesting;

    init() {
        self.a = StringsNesting{
            s1: "one",
            s2: null,
            i: 77
        };
    }
}