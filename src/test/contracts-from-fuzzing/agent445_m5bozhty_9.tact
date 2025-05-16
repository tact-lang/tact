struct NestedDefault {
    x: Int = 2;
    y: Bool = false;
    z: String = "default";
}

contract DefaultsStorage {
    val: NestedDefault;
    init() {
        self.val = NestedDefault{};
    }
}