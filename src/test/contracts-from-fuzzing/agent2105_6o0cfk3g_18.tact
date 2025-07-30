struct StructWithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
}

contract TestContract {
    s: StructWithDefaults;

    init() {
        self.s = StructWithDefaults{};
    }
}