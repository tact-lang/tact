struct S1 { val: Int; }
struct S2 { val: Int; }
struct Holder {
    v1: S1?;
    v2: S2?;
}

contract OptDistinct {
    h: Holder?;

    init() {
        self.h = null;
    }
}