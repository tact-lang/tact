struct OptionalNestedDeep {
    l3val: Int?;
}

struct OptionalNestedMid {
    l3: OptionalNestedDeep?;
}

struct OptionalNestedTop {
    l2: OptionalNestedMid?;
}

contract OptionalDeepContract {
    nested: OptionalNestedTop;

    init() {
        self.nested = OptionalNestedTop {
            l2: OptionalNestedMid {
                l3: null
            }
        };
    }
}