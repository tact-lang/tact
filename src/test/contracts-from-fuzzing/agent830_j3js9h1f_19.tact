struct HasManyStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestStrings {
    data: HasManyStrings;

    init() {
        self.data = HasManyStrings{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}