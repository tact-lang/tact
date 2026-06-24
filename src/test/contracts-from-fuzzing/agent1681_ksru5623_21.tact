struct NestedDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "a";
}

contract StructWithDefaultFieldsInStorage {
    val: NestedDefaults;
    init() {
        self.val = NestedDefaults{};
    }
}