struct DeepNest {
    inner: InnerLayer;
}

struct InnerLayer {
    flag: Bool;
    val: Int;
}

contract TestContract {
    s: DeepNest;
    
    init() {
        self.s = DeepNest{
            inner: InnerLayer{ flag: false, val: 123 }
        };
    }
}