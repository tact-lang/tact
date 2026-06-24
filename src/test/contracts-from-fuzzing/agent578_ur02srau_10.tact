struct NestedStrings {
    s1: String = "one";
    s2: String = "two";
    s3: String?;
}

contract StringStructTest {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            s1: "newone",
            s2: "newtwo",
            s3: "maybe"
        };
    }
}