struct LargeStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StoreLongStrings {
    data: LargeStrings;

    init() {
        self.data = LargeStrings{
            s1: "hello",
            s2: "this is fuzzing",
            s3: "find bugs"
        };
    }
}