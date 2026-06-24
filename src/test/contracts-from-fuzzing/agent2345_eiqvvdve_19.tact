struct NestedOptDefaults {
    a: Int? = null;
    b: String? = "hi";
}

contract DefOpt {
    v: NestedOptDefaults;

    init() {
        self.v = NestedOptDefaults{};
    }
}