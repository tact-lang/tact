struct SNested {
    opt: Int?;
    inside: MaybeStr;
}

struct MaybeStr {
    s: String?;
}

contract NestedOptMix {
    data: SNested = SNested{ opt: null, inside: MaybeStr{ s: null } };
    init() {}
}