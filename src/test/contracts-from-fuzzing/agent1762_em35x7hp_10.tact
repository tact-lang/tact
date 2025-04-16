struct NestedOptionals {
    a: Int?;
    b: Bool?;
}

contract OptionalFields {
    x: Int? = null;
    s: NestedOptionals? = null;

    init() {
        self.x = 123;
        self.s = NestedOptionals{
            a: 5,
            b: false,
        };
    }
}