struct StringNest {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

contract TestStrings {
    val: StringNest;

    init() {
        self.val = StringNest{
            s1: "foo",
            s2: null,
            s3: "bar",
            s4: "baz",
        };
    }

    receive() {
        self.val = self.val;
    }
}