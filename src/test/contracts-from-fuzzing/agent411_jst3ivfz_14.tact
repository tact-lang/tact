struct SOpt {
    x: Int?;
}

struct SDeep {
    inner: SOpt?;
}

contract ContractDeepOption {
    s: SDeep;

    init() {
        self.s = SDeep{ inner: null };
    }
}