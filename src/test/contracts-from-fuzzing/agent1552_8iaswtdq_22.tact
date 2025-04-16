struct Inner1 { f1: Int; }
struct Inner2 { f2: Int; }
struct Inner3 { f3: Bool; }

struct Combo {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

contract StructMix {
    rec: Combo;

    init() {
        self.rec = Combo{
            a: Inner1{f1:1},
            b: Inner2{f2:2},
            c: Inner3{f3:true},
        };
    }
}