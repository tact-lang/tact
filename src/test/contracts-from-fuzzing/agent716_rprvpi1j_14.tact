struct OptionedNest {
    a: Int?;
    b: String? = null;
    c: Bool?;
}

struct ParamContain {
    val: OptionedNest;
}

contract ParamContract(
    nest: OptionedNest,
    container: ParamContain,
) {}