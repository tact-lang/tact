struct DefaultsNested {
    a: Int = 1;
    b: Bool? = null;
}

contract UseDefaults {
    val: DefaultsNested;

    init() {
        self.val = DefaultsNested{};
    }
}