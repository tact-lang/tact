struct S2 { y:Int; }
struct S1 { x:S2; }

contract SeqStruct {
    s: S1;

    init() {
        self.s = S1{ x:S2{ y:123 } };
    }
}