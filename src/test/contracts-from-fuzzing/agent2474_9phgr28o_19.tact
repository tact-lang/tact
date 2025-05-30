struct Nested {
    number: Int? = null;
    active: Bool? = null;
}

struct Container {
    label: String = "container";
    nested: Nested = Nested{};
}

contract ExplicitInitDeepDefaults {
    data: Container;

    init() {
        self.data = Container{};
    }
}
