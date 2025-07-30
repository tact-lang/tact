struct SOpt {
    opt: Int?;
}

contract ContractOpt {
    f: SOpt?;
    init() {
        self.f = SOpt{ opt: null };
    }
}
