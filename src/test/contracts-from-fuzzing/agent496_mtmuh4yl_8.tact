struct NestedDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "test";
}

contract DefaultsInStruct {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{};
    }
}