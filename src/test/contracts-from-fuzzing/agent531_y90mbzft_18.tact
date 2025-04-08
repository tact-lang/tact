struct NestedDefaults {
    a: Int = 11;
    b: String = "ok";
}

struct OuterDef {
    nested: NestedDefaults = NestedDefaults{};
    c: Int = 9;
}

contract DefStructs {
    d: OuterDef;

    init() {
        self.d = OuterDef{};
    }
}