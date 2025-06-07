struct NestedMixedDefaults {
    a: Int;
    b: Bool = false;
    c: String;
    d: Bool? = null;
    e: Int?;
}

contract NestedMixedDefaultsContract {
    s: NestedMixedDefaults;
    init() {
        self.s = NestedMixedDefaults{ a: 1, c: "x", e: null };
    }
}