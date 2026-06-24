struct NestedWithDefaults {
    a: Int = 42;
    b: Bool?;
    c: String = "hi";
}

contract DefaultsAndOptionals {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults {};
    }
}