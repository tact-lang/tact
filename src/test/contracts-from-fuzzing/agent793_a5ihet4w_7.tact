struct StringNested {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    inner: StringNested;

    init() {
        self.inner = StringNested{
            s1: "alpha",
            s2: "beta",
            s3: "gamma"
        };
    }

    receive() {}
}