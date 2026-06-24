struct StructWithStringDefaults {
    s: String = "Hello";
    t: String = "";
}

contract StringDefaults {
    f: StructWithStringDefaults;

    init() {
        self.f = StructWithStringDefaults{};
    }
}