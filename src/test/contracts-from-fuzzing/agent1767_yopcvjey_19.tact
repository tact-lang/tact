struct NestedDefaults {
    a: Int;
    b: Bool = true;
}

struct ChainDefaults {
    nest: NestedDefaults;
    z: String = "qqq";
}

contract NestedDefaultHolder {
    s: ChainDefaults;

    init() {
        self.s = ChainDefaults{
            nest: NestedDefaults{ a: 42 }
        };
    }
}
