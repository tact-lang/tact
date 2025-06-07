struct StructWithEmptyStringDefaults {
    s1: String = "";
    s2: String = "";
    s3: String = "";
}

contract TestEmptyStrings {
    field: StructWithEmptyStringDefaults;
    init() {
        self.field = StructWithEmptyStringDefaults{};
    }
}