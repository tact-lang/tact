struct ComplexDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Bool? = null;
    d: String = "hi";
    e: String? = null;
}

contract StructWithDefaults {
    val: ComplexDefaults;

    init() {
        self.val = ComplexDefaults{};
    }
}