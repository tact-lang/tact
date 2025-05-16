struct OptDeepNest {
    maybeInner: InnerLayer?;
}

struct InnerLayer {
    flag: Bool;
    val: Int;
}

contract TestContract {
    s: OptDeepNest;
    
    init() {
        self.s = OptDeepNest{
            maybeInner: null
        };
    }
}