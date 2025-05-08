struct OptionalNested {
    optionalInner: Inner?;
}

struct Inner {
    stringVal: String?;
}

contract OptionalChain {
    state: OptionalNested;
    init() {
        self.state = OptionalNested{ optionalInner: Inner{ stringVal: null } };
    }
}