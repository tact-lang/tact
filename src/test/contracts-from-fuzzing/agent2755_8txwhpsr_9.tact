struct DeepInner {
    val: Int = 0;
}
struct MidLayer {
    innerOpt: DeepInner? = null;
}
struct TopLayer {
    nestedOpt: MidLayer? = null;
}

contract OptOptOpt {
    tripleOpt: TopLayer = TopLayer{};
}