struct MultiOption {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract OptionPersist {
    opts: MultiOption;
    init() {
        self.opts = MultiOption{
            intOpt: null,
            boolOpt: true,
            stringOpt: null,
        };
    }
}
