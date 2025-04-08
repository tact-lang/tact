struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalCombo {
    inner: NestedOptionals;

    init() {
        self.inner = NestedOptionals{
            a: null,
            b: null,
            c: true
        };
    }
}