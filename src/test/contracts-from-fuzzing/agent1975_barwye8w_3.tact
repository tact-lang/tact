struct DefaultsNested {
    s: String = "default";
    b: Bool = true;
}

contract StructDefaultNestedTest {
    field: DefaultsNested;

    init() {
        self.field = DefaultsNested{};
    }
}
