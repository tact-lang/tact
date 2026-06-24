struct NestedStrings {
    s1: String;
    s2: InnerStrings;
}

struct InnerStrings {
    s3: String?;
    s4: String;
}

contract StringsExample {
    data: NestedStrings;
    init() {
        self.data = NestedStrings{
            s1: "one",
            s2: InnerStrings{
                s3: null,
                s4: "two"
            }
        };
    }
}