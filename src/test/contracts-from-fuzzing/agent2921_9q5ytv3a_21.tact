struct Innermost {
    x: Int;
}
struct MidInnerOpt {
    inner: Innermost?;
}
struct LayerOpt {
    mid: MidInnerOpt?;
}

contract OptChain {
    field: LayerOpt;
    init() {
        self.field = LayerOpt{
            mid: MidInnerOpt{
                inner: null
            }
        };
    }
}
