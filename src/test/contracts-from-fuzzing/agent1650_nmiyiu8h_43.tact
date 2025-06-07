struct OptionalsChain {
    part1: Int?;
    part2: Int?;
    part3: Int?;
    part4: Int?;
}

contract ContractWithChainOpt {
    data: OptionalsChain;

    init() {
        self.data = OptionalsChain{
            part1: null,
            part2: null,
            part3: null,
            part4: null,
        };
    }
}