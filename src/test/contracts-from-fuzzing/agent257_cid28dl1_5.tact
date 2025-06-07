struct OptionalMix {
    oi: Int?;
    ob: Bool?;
    oc: Cell?;
    oa: Address?;
    os: String?;
}

contract OptionalsStorage {
    s: OptionalMix = OptionalMix{
        oi: null,
        ob: null,
        oc: null,
        oa: null,
        os: null
    };
    init() {}
}