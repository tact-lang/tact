struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct Combo {
    aa: A;
    bb: B;
    cc: C;
}

contract ComboC {
    combo: Combo;

    init() {
        self.combo = Combo{
            aa: A{a:1},
            bb: B{b:2},
            cc: C{c:3}
        };
    }
}
