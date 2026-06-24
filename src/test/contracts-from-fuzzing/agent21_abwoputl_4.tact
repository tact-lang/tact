struct MultiOpt {
    flag: Bool?;
    addr: Address?;
    amount: Int?;
}

contract MixedOptionals {
    data: MultiOpt;

    init() {
        self.data = MultiOpt{
            flag: true,
            addr: null,
            amount: 100
        };
    }
}
