struct LargeStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract LargeStringsContract {
    data: LargeStrings;

    init() {
        self.data = LargeStrings{
            s1: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
            s2: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
            s3: "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC",
        };
    }
}