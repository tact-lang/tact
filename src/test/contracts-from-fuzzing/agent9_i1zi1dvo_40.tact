struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

struct Combo {
    a: A;
    b: B;
    c: C;
}

contract ComboStructs {
    combo: Combo;

    init() {
        self.combo = Combo {
            a: A{a:1},
            b: B{b:2},
            c: C{c:3}
        };
    }
}