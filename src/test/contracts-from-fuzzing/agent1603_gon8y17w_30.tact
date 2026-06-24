struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct ContainsNestedDef {
    n: NestedDefaults;
    m: String;
}

contract NestedStructDefaults {
    d: ContainsNestedDef;

    init() {
        self.d = ContainsNestedDef{
            n: NestedDefaults{},
            m: "m"
        };
    }
}