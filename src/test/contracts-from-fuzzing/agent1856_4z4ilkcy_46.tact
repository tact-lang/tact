struct OptionalDeepRec {
    s: String?;
}

struct HasOptRec {
    o: OptionalDeepRec?;
}

contract OptChainParams(
    h: HasOptRec?,
    flag: Bool?,
    value: Int?
) {}
