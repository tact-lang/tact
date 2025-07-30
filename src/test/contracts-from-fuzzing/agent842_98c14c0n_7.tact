struct NestedStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract StringStructTest {
    data: NestedStrings;
    
    init() {
        self.data = NestedStrings{
            s1: "foo",
            s2: null,
            s3: "bar",
            s4: null
        };
    }
}