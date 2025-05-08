struct SOpt {
    inner: InnerS?;
}

struct InnerS {
    x: Int;
}

contract ContractSOpt {
    s: SOpt;

    init() {
        self.s = SOpt{
            inner: null
        };
    }
}