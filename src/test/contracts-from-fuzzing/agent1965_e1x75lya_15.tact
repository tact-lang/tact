struct A { a: Int }
struct B { b: Int }
struct C { c: Int }
struct D { d: Int }
struct E { e: Int }

struct Combo {
    sa: A;
    sb: B;
    sc: C;
    sd: D;
    se: E;
}

contract ManyStructs {
    val: Combo;
    init() {
        self.val = Combo{
            sa: A{a:1},
            sb: B{b:2},
            sc: C{c:3},
            sd: D{d:4},
            se: E{e:5},
        };
    }
}