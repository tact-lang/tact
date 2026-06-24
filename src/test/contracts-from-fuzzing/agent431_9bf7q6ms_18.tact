struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract DefaultsStruct {
    x: NestedDefaults;

    init() {
        self.x = NestedDefaults{};
    }
}
