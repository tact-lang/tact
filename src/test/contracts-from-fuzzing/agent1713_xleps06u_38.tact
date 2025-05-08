struct StructWithStringDefaults {
    s: String = "";
    opt: String? = null;
}

contract StringDefaultsInside {
    field: StructWithStringDefaults;
    init() {
        self.field = StructWithStringDefaults{};
    }
}