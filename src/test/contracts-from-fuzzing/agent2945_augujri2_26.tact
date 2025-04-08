struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringNest {
    str: NestedStrings;

    init() {
        self.str = NestedStrings{s1: "a", s2: "b", s3: "c"};
    }
}