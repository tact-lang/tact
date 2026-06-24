struct HasOpt {
    a: Int?;
}

struct WrapsOpt {
    s: HasOpt;
}

contract NestedOptInStruct {
    field: WrapsOpt;

    init() {
        self.field = WrapsOpt{ s: HasOpt{ a: null } };
    }
}