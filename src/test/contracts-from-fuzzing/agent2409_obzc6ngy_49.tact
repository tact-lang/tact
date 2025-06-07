struct NestedDefaultsOpt {
    a: Int?;
    b: Bool?;
}

struct OuterDef {
    nested: NestedDefaultsOpt = NestedDefaultsOpt{ a:null, b:null };
}

contract StructWithDefaultsOpt {
    s: OuterDef;

    init() {
        self.s = OuterDef{};
    }
}