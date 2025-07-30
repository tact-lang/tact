struct StructWithDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultVals {
    s: StructWithDefaults;

    init() {
        self.s = StructWithDefaults{};
    }
}
