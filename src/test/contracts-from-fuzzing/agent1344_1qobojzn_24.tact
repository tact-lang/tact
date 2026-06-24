struct FlagOnly {
    flag: Bool;
}

contract OptionalContractField {
    stuff: FlagOnly?;

    init() {
        self.stuff = FlagOnly{flag: true};
    }
}
