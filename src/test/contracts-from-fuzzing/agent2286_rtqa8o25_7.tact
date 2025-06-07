struct Inner {
    optInt: Int?;
    flag: Bool;
}

contract OptionalWithNestedStruct {
    nested: Inner? = null;

    init() {
        self.nested = Inner{
            optInt: 42,
            flag: true
        };
    }
}