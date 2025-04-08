struct OptionalStruct {
    a: Int?;
}

struct WrapOptStruct {
    s: OptionalStruct?;
}

struct TopWrap {
    w: WrapOptStruct?;
}

contract NestedOptionalLayers {
    data: TopWrap? = null;
    init() {}
}