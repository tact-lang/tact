struct DeepOptional {
    nested: Int?;
}

struct MiddleOptional {
    nested: DeepOptional?;
}

struct OuterOpt {
    nested: MiddleOptional?;
}

contract OptChain {
    val: OuterOpt = OuterOpt{
        nested: null,
    };
}
