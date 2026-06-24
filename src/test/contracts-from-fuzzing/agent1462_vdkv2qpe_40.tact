// optional struct wrapping optional struct containing optional primitive
struct PrimOpt {
    x: Int?;
}

struct OuterOpt {
    inner: PrimOpt?;
}

contract OptWrappedOptPrim {
    f: OuterOpt?;

    init() {
        self.f = null;
    }
}