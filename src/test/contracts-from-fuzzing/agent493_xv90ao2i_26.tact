struct DeepOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DeepOptDefault {
    val: DeepOptionalDefaults;

    init() {
        self.val = DeepOptionalDefaults{};
    }
}