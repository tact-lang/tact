struct StructWithDefaults {
    i: Int = 5;
    b: Bool = true;
    s: String = "test";
    o: Address? = null;
}

contract DefaultsHolder {
    val: StructWithDefaults;

    init() {
        self.val = StructWithDefaults{};
    }
}
