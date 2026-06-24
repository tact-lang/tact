struct InnerOpt {
    num: Int?;
}

struct OuterOpt {
    inner: InnerOpt = InnerOpt{};
}

contract NestedOptional {
    outer: OuterOpt = OuterOpt{};
}