struct DeepOpt2 {
    v: Int?;
}

struct Wrap1Opt2 {
    deep: DeepOpt2?;
}

contract OptionalFieldNestedOptionalStruct {
    f: Wrap1Opt2? = null;
    init() {}
}