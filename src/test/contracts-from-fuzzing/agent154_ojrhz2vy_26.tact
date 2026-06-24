struct SOpt {
    field1: Int?;
    field2: Bool?;
}

struct SNestOpt {
    inner: SOpt?;
}

contract NestedInnerOpt {
    f: SNestOpt;

    init() {
        self.f = SNestOpt { inner: null };
    }
}