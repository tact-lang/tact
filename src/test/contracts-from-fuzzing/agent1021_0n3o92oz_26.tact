struct WithStrings {
    s1: String = "first";
    s2: String = "second";
    s3: String = "third";
}

contract MultiStringInit {
    val: WithStrings;

    init() {
        self.val = WithStrings{};
    }
}