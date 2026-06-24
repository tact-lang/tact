struct NestedDefaults {
    x: Int = 5;
    y: Int;
}

struct OuterDef {
    nested: NestedDefaults = NestedDefaults{ y: 10 };
    z: Int;
}

contract NestedDefaultsContract {
    data: OuterDef;

    init() {
        self.data = OuterDef{
            z: 42
        };
    }
}