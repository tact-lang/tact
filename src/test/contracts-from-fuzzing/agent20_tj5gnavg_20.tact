struct BoolDefault {
    flag: Bool = false;
}

contract DefaultFlagContract {
    test: BoolDefault;

    init() {
        self.test = BoolDefault{};
    }
}