struct NullableDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract NullableDefaultsStorage {
    s: NullableDefaults;
    
    init() {
        self.s = NullableDefaults{};
    }
}
