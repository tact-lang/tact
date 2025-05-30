struct SimpleOpt {
    a: Int?; 
    b: Bool?;
}

contract ContractOpt {
    s: SimpleOpt;
    init() {
        self.s = SimpleOpt{};
    }
}
