struct MoreDefaults {
    one: Int = 10;
    two: String = "ten";
    three: Bool = true;
}

contract DefVals {
    val: MoreDefaults;
    init() {
        self.val = MoreDefaults{};
    }
}