struct SOpt {
    f1: Int?;
    f2: Bool?;
}

struct SNestOpt {
    s: SOpt?;
}

contract NestedOptFields {
    f: SNestOpt;
    init() {
        self.f = SNestOpt{ s: null };
    }
}