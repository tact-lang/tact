struct NestedDefaults {
    x: Int = 7;
    y: Bool = true;
    msg: String = "hi";
}

contract DefaultsWithNested {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{}; // apply defaults
    }
}
