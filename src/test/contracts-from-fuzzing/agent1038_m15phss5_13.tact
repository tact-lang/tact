struct DeepOpt {
    s: Int?;
}

struct WrapOpt {
    deep: DeepOpt?;
}

contract DoubleOptionalStruct {
    v: WrapOpt? = null;
    init() {}
}