struct NestedWithDefaults {
    inner: BoolDefaults;
    flag: Bool = true;
}

struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
}

contract NestedDefaultStructs {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{
            inner: BoolDefaults{},
            flag: false
        };
    }
}