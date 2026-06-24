struct LongStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            s1: "hello",
            s2: "world",
            s3: "this is a very long string just to test behavior"
        };
    }
}
