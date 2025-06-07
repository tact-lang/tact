struct LargeStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract LargeStringContract {
    data: LargeStrings;

    init() {
        self.data = LargeStrings{
            s1: "a",
            s2: "b",
            s3: "c",
        };
    }
}