struct OptionalChain {
    x: Int?;
}

contract OptionalReassign {
    f: OptionalChain;
    init() {
        self.f = OptionalChain{ x:null };
        self.f = OptionalChain{ x:25 };
        self.f = OptionalChain{ x:null };
    }
}