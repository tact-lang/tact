struct DeepOpt {
    optInner: Inner?;
}

struct Inner {
    value: Int?;
}

contract ParamDeepOptional(
    nested: DeepOpt?
) {}