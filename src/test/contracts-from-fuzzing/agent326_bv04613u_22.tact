struct OptsAndDefaults {
    a: Int? = null;
    b: String = "z";
    c: Bool? = null;
    d: String? = null;
}

contract ComboTest {
    v: OptsAndDefaults;

    init() {
        self.v = OptsAndDefaults{};
    }
}
