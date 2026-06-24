struct ComboOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract ComboOptDefTest {
    data: ComboOptionalDefaults;

    init() {
        self.data = ComboOptionalDefaults{};
    }
}