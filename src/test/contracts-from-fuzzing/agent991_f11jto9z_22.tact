struct InnerS {
    score: Int;
}

struct OuterS {
    inner: InnerS? = null;
    val: Int = 5;
}

contract NestedOptDefault {
    store: OuterS = OuterS{};
    init() {}
}