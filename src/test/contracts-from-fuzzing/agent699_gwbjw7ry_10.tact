struct MixOpt {
    addr: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixedOptionals {
    mixed: MixOpt;

    init() {
        self.mixed = MixOpt{
            addr: myAddress(),
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}
