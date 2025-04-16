struct SDef {
    x: Int = 1;
    y: Bool = false;
    z: String = "test";
}

contract StructWithDefaults {
    val: SDef;

    init() {
        self.val = SDef{};
    }
}
