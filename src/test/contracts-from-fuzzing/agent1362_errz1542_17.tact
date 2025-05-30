struct SDeepOpt {
    nestedOpt: SInner?;
}

struct SInner {
    value: Int;
}

contract DeepOptionalStruct {
    deep: SDeepOpt = SDeepOpt{ nestedOpt: null };
}