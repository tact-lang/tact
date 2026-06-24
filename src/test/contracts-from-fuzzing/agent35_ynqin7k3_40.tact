struct StructWithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract DefInner {
    data: StructWithDefaults;

    init() {
        self.data = StructWithDefaults{};
    }
}