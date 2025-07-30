struct InnerOpt {
    s: String? = "hi";
    f: Bool? = true;
}

struct OuterOpt {
    nested: InnerOpt = InnerOpt{};
}

contract NestedOptionalsDefaults {
    cfg: OuterOpt = OuterOpt{};
}