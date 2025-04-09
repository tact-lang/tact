struct InnerMost { f: Int = 11; }
struct InnerOpt { x: InnerMost?; }
struct OuterOpt { y: InnerOpt?; }

contract OptChain {
    outer: OuterOpt = OuterOpt{};
    init() {}
}