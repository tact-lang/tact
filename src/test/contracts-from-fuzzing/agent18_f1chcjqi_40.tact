struct ManyOptDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract ManyOptDef {
    val: ManyOptDefaults;
    init() {
        self.val = ManyOptDefaults{};
    }
}