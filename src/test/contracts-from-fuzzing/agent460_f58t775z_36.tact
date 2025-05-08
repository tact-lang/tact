struct NestedStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract NestedStringsTest {
    field: NestedStrings = NestedStrings{
        s1: "a",
        s2: null,
        s3: "b",
        s4: null
    };
    init() {
        self.field = NestedStrings{
            s1: "x",
            s2: "y",
            s3: "z",
            s4: null
        };
    }
}
