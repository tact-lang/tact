struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStrings {
    store: NestedStrings;

    init() {
        self.store = NestedStrings{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}