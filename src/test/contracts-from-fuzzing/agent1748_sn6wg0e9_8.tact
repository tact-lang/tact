struct LargeStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    data: LargeStrings;

    init() {
        self.data = LargeStrings{
            s1: "A very long string AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
            s2: "Another long string BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
            s3: "Third long string CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
        };
    }
}