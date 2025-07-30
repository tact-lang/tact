struct NestedWithDefaults {
    data: InlineDefault? = null;
}

struct InlineDefault {
    foo: Int = 42;
    bar: Bool = false;
}

contract OptionalDefaultField {
    val: NestedWithDefaults;

    init() {
        self.val = NestedWithDefaults{};
    }
}