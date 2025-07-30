struct NestedWithOptionals {
    s1: String;
    s2: String?;
    s3: String;
}

contract OptionalStructFields {
    val: NestedWithOptionals;
    init() {
        self.val = NestedWithOptionals{
            s1: "hi",
            s2: null,
            s3: "bye",
        };
    }
}