struct NestedWithDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultsInStruct {
    f: NestedWithDefaults;

    init() {
        self.f = NestedWithDefaults{};
    }
}