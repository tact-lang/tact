struct NestedStrings {
    s1: String;
    s2: InnerS;
}

struct InnerS {
    s3: String;
    s4: String?;
}

contract StringsTest {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            s1: "primary",
            s2: InnerS{ s3: "nested", s4: null }
        };
    }
}