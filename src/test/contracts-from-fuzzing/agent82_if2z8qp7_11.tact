struct MultiStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract Test {
    ss: MultiStrings;

    init() {
        self.ss = MultiStrings { s1: "hello", s2: "world", s3: "!" };
    }
}