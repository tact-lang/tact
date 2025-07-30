struct StructWithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    s: StructWithDefaults;

    init() {
        self.s = StructWithDefaults{};
    }
}