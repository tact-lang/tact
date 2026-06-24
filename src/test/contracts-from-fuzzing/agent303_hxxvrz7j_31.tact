struct StructWithOptionalDefaults {
    flag: Bool? = null;
    description: String? = null;
    count: Int = 0;
}

contract OptionalStructInit {
    data: StructWithOptionalDefaults;

    init() {
        self.data = StructWithOptionalDefaults{};
    }
}