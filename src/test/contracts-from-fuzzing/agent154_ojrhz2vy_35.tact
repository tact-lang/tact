struct S1 { a: Int; }
struct S2 { b: Int; }
struct SOpt { o: S1?; }

contract StructOptMix {
    s: S2;
    so: SOpt;

    init() {
        self.s = S2{b:7};
        self.so = SOpt{o:null};
    }
}