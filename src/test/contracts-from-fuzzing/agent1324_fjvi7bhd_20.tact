struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    y: InnerOpt = InnerOpt{};
}

contract RecursiveOptNil {
    data: OuterOpt = OuterOpt{};
    init() {}
}