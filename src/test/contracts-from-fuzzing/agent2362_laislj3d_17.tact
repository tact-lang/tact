struct OptionalNestedBool {
    a: Bool;
    b: Bool?;
    c: Bool?;
}

contract OptionalNestedTest {
    nested: OptionalNestedBool;
    init() {
        self.nested = OptionalNestedBool{
            a: false,
            b: true,
            c: null
        };
    }
}