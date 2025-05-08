struct NestedStrings {
    s1: String;
    s2: String;
    inner: InnerStr;
}

struct InnerStr {
    s3: String;
    s4: String;
}

contract NestedStringContract {
    field: NestedStrings;

    init() {
        self.field = NestedStrings{
            s1: "a",
            s2: "b",
            inner: InnerStr{ s3: "c", s4: "d" },
        };
    }
}