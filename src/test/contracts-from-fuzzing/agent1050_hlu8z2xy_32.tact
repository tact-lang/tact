struct DefaultedNested {
    i: Int = 1;
    b: Bool = true;
    s: String = "a";
}

struct HasNestedDefault {
    nested: DefaultedNested = DefaultedNested{};
}

contract NestedDefaults {
    val: HasNestedDefault;

    init() {
        self.val = HasNestedDefault{};
    }
}
