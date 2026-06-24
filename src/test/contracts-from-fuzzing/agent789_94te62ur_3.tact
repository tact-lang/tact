struct Inner {
    u: Int?;
    flag: Bool;
    note: String?;
}

contract OptionalNestedTest {
    nested: Inner;

    init() {
        self.nested = Inner {
            u: null,
            flag: false,
            note: null
        };
    }
}
