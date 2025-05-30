struct Opts {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract OptionalDeep {
    optField: Opts?;

    init() {
        self.optField = Opts{
            intOpt: null,
            boolOpt: true,
            stringOpt: null
        };
    }
}