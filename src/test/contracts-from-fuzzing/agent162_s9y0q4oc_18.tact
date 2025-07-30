struct NestedStrings {
    s1: String;
    s2: String?;
    s3: InnerStr;
}

struct InnerStr {
    s4: String;
    s5: String?;
}

contract TestContract {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            s1: "a",
            s2: "b",
            s3: InnerStr{
                s4: "c",
                s5: null
            }
        };
    }
}