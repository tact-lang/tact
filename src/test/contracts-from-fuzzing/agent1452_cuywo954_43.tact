struct OptionalInDefault {
    id: Int?;
    flag: Bool?;
}

contract OptionalDefaultVals {
    s: OptionalInDefault = OptionalInDefault{
        id: null,
        flag: null
    };

    init() {
        self.s = OptionalInDefault{ id: null, flag: true };
    }
}
