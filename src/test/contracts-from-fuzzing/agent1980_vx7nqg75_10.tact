struct InlineDefault {
    a: Int = 42;
    b: Bool = true;
    c: String = "default";
    d: Int?;
}

struct NestedDefault {
    a: Int = 1;
    nested: InlineDefault = InlineDefault{};
}

contract NestedDefaultsTest {
    content: NestedDefault;

    init() {
        self.content = NestedDefault{};
    }
}