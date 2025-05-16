struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringHeavy {
    field: NestedStrings;

    init() {
        self.field = NestedStrings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma",
        };
    }
}