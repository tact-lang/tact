struct OptSerializeDefaults {
    a: Int? as int64 = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptSerDefCon {
    val: OptSerializeDefaults;
    init() {
        self.val = OptSerializeDefaults{};
    }
}