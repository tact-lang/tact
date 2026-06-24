struct LeafOpt {
    x: Int? = null;
    y: String? = null;
}

struct InnerOpt {
    leaf: LeafOpt? = null;
    flag: Bool = false;
}

contract NestedOptionDefault {
    inner: InnerOpt = InnerOpt{};
    num: Int = 3;
    alive: Bool = true;

    init() {}
}