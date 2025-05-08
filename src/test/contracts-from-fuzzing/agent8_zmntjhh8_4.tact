struct OptionalNest {
    innerOpt: String?;
    flag: Bool;
}

contract OptionCombo {
    state: OptionalNest?;

    init() {
        self.state = OptionalNest{
            innerOpt: null,
            flag: true
        };
    }
}