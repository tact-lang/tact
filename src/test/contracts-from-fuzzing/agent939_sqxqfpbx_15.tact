struct StringStruct {
    s1: String;
    s2: String;
    s3: String;
}

contract Test {
    val: StringStruct;

    init() {
        self.val = StringStruct {
            s1: "foo",
            s2: "bar",
            s3: "baz"
        };
    }
}