struct OptionalsInStruct {
    optA: Int?;
    optB: Bool?;
    optC: String?;
}

contract OptStructMix {
    s: OptionalsInStruct = OptionalsInStruct{ optA: null, optB: true, optC: null };
}