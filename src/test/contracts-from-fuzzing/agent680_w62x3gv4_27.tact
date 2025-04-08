struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "def";
}

contract StructWithDefaultsField {
    strct: HasDefaults = HasDefaults{};

    receive() {
        let _ = self.strct.a + 1;
    }
}