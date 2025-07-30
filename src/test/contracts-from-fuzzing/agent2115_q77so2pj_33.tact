// optional struct of nested struct type, initialized explicitly
struct InnerMost {
    z: Int = 5;
}

struct OuterLayer {
    inn: InnerMost;
}

contract OptStructWrap {
    outer: OuterLayer?;
    init() {
        self.outer = OuterLayer{ inn: InnerMost{} };
    }
}