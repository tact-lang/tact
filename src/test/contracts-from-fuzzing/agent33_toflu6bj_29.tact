struct Strings {
    s1: String = "foo";
    s2: String = "bar";
    s3: String = "baz";
}

contract TestContract {
    texts: Strings;

    init() {
        self.texts = Strings{
            s1: "hello",
            s2: "world",
            s3: "!"
        };
    }
}