struct InnerOptDefaults {
    x: Int? = null;
}

struct OuterOpt {
    inner: InnerOptDefaults? = null;
}

contract NestedOptionalDefaults {
    val: OuterOpt = OuterOpt{};
}