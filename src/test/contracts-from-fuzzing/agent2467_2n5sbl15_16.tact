struct Inner { a: Int; }
struct Outer { inr: Inner?; }

contract OuterOpt {
    f: Outer;
    init() {
        self.f = Outer{ inr: null };
    }
}