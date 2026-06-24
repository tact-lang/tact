struct Inner {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract MultipleStrings {
    inner: Inner;
    init() {
        self.inner = Inner{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d",
        };
    }
}