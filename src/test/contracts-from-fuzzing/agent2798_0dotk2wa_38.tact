struct StructWithStringDefaults {
    a: String = "abc";
    b: String = "def";
    c: String = "ghi";
}

contract StringDefaultsContract {
    data: StructWithStringDefaults;

    init() {
        self.data = StructWithStringDefaults{};
    }
}