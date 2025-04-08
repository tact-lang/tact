struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract StructWithStrings {
    val: WithStrings;

    init() {
        self.val = WithStrings{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}