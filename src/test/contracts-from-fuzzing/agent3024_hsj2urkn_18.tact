struct NestedStrings {
    s1: String;
    s2: String?;
    s3: InnerString;
}

struct InnerString {
    s4: String;
    s5: String?;
}

contract TestNestedStrings {
    field: NestedStrings;

    init() {
        self.field = NestedStrings{
            s1: "one",
            s2: null,
            s3: InnerString{s4:"four", s5:"five"}
        };
    }
}
