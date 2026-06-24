struct OptionalNestedWithDefault {
    flag: Bool? = null;
    nested: Nested? = null;
}

struct Nested {
    val: Int;
}

contract TestContract {
    data: OptionalNestedWithDefault;

    init() {
        self.data = OptionalNestedWithDefault{
            flag: null,
            nested: null
        };
    }
}
