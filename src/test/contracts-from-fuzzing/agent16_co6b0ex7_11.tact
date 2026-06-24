struct NestedDefaults {
    x: Int = 1;
    y: Int = 2;
}

struct Wrapper {
    nested: NestedDefaults;
}

contract NestedDefaultStruct {
    v: Wrapper;

    init() {
        self.v = Wrapper{nested: NestedDefaults{}};
    }
}