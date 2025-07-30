struct OptionCycle {
    inner: OptionInner?;
}

struct OptionInner {
    next: OptionNext?;
}

struct OptionNext {
    value: Int?;
}

contract OptionalChain {
    root: OptionCycle;

    init() {
        self.root = OptionCycle{
            inner: OptionInner{
                next: null
            }
        };
    }
}