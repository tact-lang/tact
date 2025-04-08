struct NestedWithMixedDefaults {
    a: Int = 7;
    b: Bool?;
    c: String? = null;
    d: Bool = false;
}

contract NestedDefaults {
    nd: NestedWithMixedDefaults;

    init() {
        self.nd = NestedWithMixedDefaults {
            b: null
        };
    }
}