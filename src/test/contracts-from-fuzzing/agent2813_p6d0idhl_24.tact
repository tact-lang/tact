struct MixOptionalDefaults {
    a: Int?;
    b: Int? = 1;
    c: String?;
    d: String? = "foo";
}

contract TestMixOptDefaults {
    val: MixOptionalDefaults;
    init() {
        self.val = MixOptionalDefaults{};
    }
}
