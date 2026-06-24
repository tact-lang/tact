struct MixedOpt {
    reqInt: Int;
    optStr: String?;
    optBool: Bool?;
}

contract TestContract {
    mixed: MixedOpt;

    init() {
        self.mixed = MixedOpt{
            reqInt: 42,
            // omit optStr and optBool
        };
    }

    receive() {
        self.mixed = self.mixed;
    }
}
