struct OuterOpt {
    optInner: InnerOpt?;
}

struct InnerOpt {
    x: Int;
}

contract OptionalStructNesting {
    outer: OuterOpt = OuterOpt{ optInner: null };
}