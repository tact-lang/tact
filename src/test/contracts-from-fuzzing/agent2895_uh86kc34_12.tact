struct OptionalStringNested {
    first: String?;
    second: String?;
}

struct Wrapper {
    nested: OptionalStringNested;
}

contract OptionalStringNestedContract {
    s: Wrapper;

    init() {
        self.s = Wrapper{ nested: OptionalStringNested{ first: null, second: null } };
    }
}
