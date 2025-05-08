struct OptionalNestedDeeper {
    inner: Int?;
    flag: Bool;
}

struct HasNestedOptionals {
    a: OptionalNestedDeeper?;
    b: OptionalNestedDeeper?;
}

contract ContainsOptionalStructOptionals {
    s: HasNestedOptionals;

    init() {
        self.s = HasNestedOptionals{ a: null, b: null };
    }
}
