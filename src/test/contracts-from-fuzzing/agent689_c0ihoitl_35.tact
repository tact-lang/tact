struct DeepOptionalDefault {
    o: InnerOpt? = null;
}

struct InnerOpt {
    x: Int? = null;
}

contract CompoundDepthDefault {
    s: DeepOptionalDefault = DeepOptionalDefault{};
}