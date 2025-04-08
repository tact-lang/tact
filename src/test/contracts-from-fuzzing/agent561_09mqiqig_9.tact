struct Texts {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract Test {
    storage: Texts;

    init() {
        self.storage = Texts{
            s1: "foo",
            s2: "bar",
            s3: "baz",
            s4: "qux",
        };
    }
}