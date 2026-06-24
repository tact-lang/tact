struct InnerDef {
    x: Int = 3;
}

contract StructWithDefaultSetter {
    val: InnerDef;

    init() {
        self.val = InnerDef{};
    }
}