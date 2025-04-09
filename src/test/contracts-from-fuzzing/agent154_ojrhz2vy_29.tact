struct S1 { a: Int; }
struct S2 { b: Int; }
struct Snest { inner1: S1; inner2: S2; }

contract NestedMix {
    nested: Snest;
    flat: Int;
    opt: Int?;

    init() {
        self.nested = Snest{ inner1: S1{a:1}, inner2: S2{b:2} };
        self.flat = 3;
        self.opt = null;
    }
}