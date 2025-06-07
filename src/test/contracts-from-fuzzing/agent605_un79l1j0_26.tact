struct StructWithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultVals {
    val: StructWithDefaults;

    init() {
        self.val = StructWithDefaults{};
    }
}