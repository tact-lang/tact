struct OnlyOpts {
    oi: Int?;
    os: String?;
    ob: Bool?;
}

contract OptionalDefaults {
    optVals: OnlyOpts;

    init() {
        self.optVals = OnlyOpts{
            oi: null,
            os: null,
            ob: null,
        };
    }
}