struct NestedBoolOpt {
    b1: Bool?;
    b2: Bool?;
}

struct WithNested {
    nested: NestedBoolOpt;
}

contract BoolNestOpt {
    f: WithNested;

    init() {
        self.f = WithNested {
            nested: NestedBoolOpt { b1:true, b2: false }
        };
    }
}
