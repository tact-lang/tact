struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StringLayer {
    layer: NestedStrings;

    init() {
        self.layer = NestedStrings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma",
        };
    }
}