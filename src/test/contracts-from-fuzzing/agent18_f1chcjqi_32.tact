struct OptDefNested {
    x: Int? = null;
    y: Bool? = null;
}

contract OptNestedDef {
    val: OptDefNested;
    init() {
        self.val = OptDefNested{};
    }
}