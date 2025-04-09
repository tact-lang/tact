struct WithString {
    s1: String;
    s2: String;
    s3: String;
}

contract TestMultipleStrings {
    val: WithString;
    init() {
        self.val = WithString{
            s1: "a",
            s2: "b",
            s3: "c"
        };
    }
}