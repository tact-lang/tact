struct SInner1 { x: Int; y: Bool; }
struct SInner2 { s: String; }

struct BigOpt {
    a: SInner1?;
    b: SInner2?;
}

contract TopOptionals {
    f1: BigOpt?;
    f2: BigOpt?;

    init() {
        self.f1 = BigOpt{ a: null, b: SInner2{ s:"abc" } };
        self.f2 = null;
    }
}