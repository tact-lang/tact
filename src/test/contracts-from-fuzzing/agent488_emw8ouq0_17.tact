struct NestedStrings {
    s1: String?;
    s2: String;
    s3: String?;
}

contract NestedStringsContract {
    foo: NestedStrings;

    init() {
        self.foo = NestedStrings{
            s1: null,
            s2: "hello",
            s3: "world"
        };
    }
}