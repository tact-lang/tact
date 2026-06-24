struct SOpt {
    val: Int?;
}

struct SNestOpt {
    inner: SOpt?;
}

contract NestedSOpt {
    f: SNestOpt?;

    init() {
        self.f = SNestOpt{
            inner: SOpt{val: 42}
        };
    }
}
