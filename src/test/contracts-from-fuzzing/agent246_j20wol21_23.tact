struct NestedBoolOpt {
    a: Bool?;
    b: Bool?;
}

struct ContainNested {
    f: NestedBoolOpt;
}

contract NestedOpts {
    data: ContainNested;
    init() {
        self.data = ContainNested{ f: NestedBoolOpt{ a: true, b: null } };
    }
}
