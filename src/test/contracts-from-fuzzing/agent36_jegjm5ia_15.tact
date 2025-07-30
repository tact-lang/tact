struct InnerOpt {
    foo: Int = 12;
}

struct OuterOpt {
    inside: InnerOpt?;
    count: Int = 5;
}

contract OptionalsNoDefaultExplicit {
    outer: OuterOpt = OuterOpt{};
}