struct MultiOpt {
    o1: Int? = null;
    o2: Bool? = true;
    o3: String? = null;
    o4: Address? = null;
}

contract OptMixDefaults {
    dat: MultiOpt = MultiOpt{
        o1: null,
        o2: true,
        o3: null,
        o4: null
    };

    init() {}
}